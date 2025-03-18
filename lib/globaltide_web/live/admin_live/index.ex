defmodule GlobaltideWeb.AdminLive.Index do
  use GlobaltideWeb, :live_view

  alias Globaltide.Accounts
  alias Globaltide.Applications
  import GlobaltideWeb.Admin.AdminComponent
  import GlobaltideWeb.Admin.AsideBarComponent

  @impl true
  def mount(_params, session, socket) do
    # Start polling every 5 seconds
    if connected?(socket), do: Process.send_after(self(), :refresh_applications, 5000)

    current_user =
      session["user_token"]
      |> case do
        nil -> nil
        token -> Accounts.get_user_by_session_token(token)
      end

    applications = Applications.list_applications()

    {:ok, assign(socket,
      current_user: current_user,
      is_sidebar_open: false,
      applications: applications
    )}
  end

  @impl true
  def handle_event("toggle_sidebar", _, socket) do
    {:noreply, assign(socket, is_sidebar_open: !socket.assigns.is_sidebar_open)}
  end

  @impl true
  def handle_event("approve", %{"id" => id}, socket) do
    with application <- Applications.get_application!(id),
         {:ok, updated_application} <- Applications.update_application(application, %{status: "Approved"}) do
      send(self(), {:application_updated, updated_application})
      {:noreply, socket}
    end
  end

  @impl true
  def handle_event("deny", %{"id" => id}, socket) do
    with application <- Applications.get_application!(id),
         {:ok, updated_application} <- Applications.update_application(application, %{status: "Denied"}) do
      send(self(), {:application_updated, updated_application})
      {:noreply, socket}
    end
  end

  @impl true
  def handle_info({:application_updated, updated_application}, socket) do
    applications = update_application_list(socket.assigns.applications, updated_application)
    {:noreply, assign(socket, :applications, applications)}
  end

  @impl true
  def handle_info(:refresh_applications, socket) do
    applications = Applications.list_applications()
    Process.send_after(self(), :refresh_applications, 5000)  # Keep polling every 5 seconds
    {:noreply, assign(socket, :applications, applications)}
  end

  defp update_application_list(applications, updated_application) do
    Enum.map(applications, fn app ->
      if app.id == updated_application.id, do: updated_application, else: app
    end)
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex w-full min-h-screen">
      <button phx-click="toggle_sidebar" class="fixed top-4 right-4 lg:hidden z-50 bg-blue-600 p-3 rounded-md text-white">
        ☰
      </button>

      <.aside_bar is_open={@is_sidebar_open} current_user={@current_user} />

      <div class="flex-1 flex flex-col p-6">
        <.admin_panel current_user={@current_user} />
        <div class="overflow-x-auto">
          <h1 class="text-2xl font-bold mb-4">Job Applications</h1>

          <table class="w-full border-collapse border border-gray-300">
            <thead>
              <tr class="bg-gray-100">
                <th class="border p-2">Job Title</th>
                <th class="border p-2">Email</th>
                <th class="border p-2">Phone</th>
                <th class="border p-2">Status</th>
                <th class="border p-2">Actions</th>
              </tr>
            </thead>
            <tbody>
              <%= for application <- @applications do %>
                <tr class="border">
                  <td class="border p-2"><%= application.job_listing && application.job_listing.job_title || "N/A" %></td>
                  <td class="border p-2"><%= application.email %></td>
                  <td class="border p-2"><%= application.phone %></td>
                  <td class="border p-2">
                    <span class={
                      case application.status do
                        "Pending" -> "text-yellow-500"
                        "Approved" -> "text-green-500"
                        "Denied" -> "text-red-500"
                        _ -> "text-gray-500"
                      end
                    }>
                      <%= application.status %>
                    </span>
                  </td>
                  <td class="border p-2">
                    <%= if application.status == "Pending" do %>
                      <button phx-click="approve" phx-value-id={application.id} class="bg-blue-500 text-white px-3 py-1 rounded">
                        Approve
                      </button>
                      <button phx-click="deny" phx-value-id={application.id} class="bg-red-500 text-white px-3 py-1 rounded ml-2">
                        Deny
                      </button>
                    <% else %>
                      <span class={
                        if application.status == "Approved", do: "text-green-500", else: "text-red-500"
                      }>
                        <%= application.status %>
                      </span>
                    <% end %>
                  </td>
                </tr>
              <% end %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    """
  end
end
