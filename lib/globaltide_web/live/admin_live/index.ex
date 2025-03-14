defmodule GlobaltideWeb.AdminLive.Index do
  use GlobaltideWeb, :live_view

  alias Globaltide.Accounts
  alias Globaltide.Applications
  import GlobaltideWeb.Admin.AdminComponent
  import GlobaltideWeb.Admin.AsideBarComponent
  alias Phoenix.PubSub

  @impl true
  def mount(_params, session, socket) do
    if connected?(socket), do: PubSub.subscribe(Globaltide.PubSub, "applications")

    current_user =
      case session["user_token"] do
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
    application = Applications.get_application!(id)

    case Applications.update_application(application, %{status: "Approved"}) do
      {:ok, _updated_application} ->
        {:noreply, put_flash(socket, :info, "Application approved successfully!")}

      {:error, _changeset} ->
        {:noreply, put_flash(socket, :error, "Failed to approve application")}
    end
  end

  @impl true
  def handle_event("deny", %{"id" => id}, socket) do
    application = Applications.get_application!(id)

    case Applications.update_application(application, %{status: "Denied"}) do
      {:ok, _updated_application} ->
        {:noreply, put_flash(socket, :info, "Application denied successfully!")}

      {:error, _changeset} ->
        {:noreply, put_flash(socket, :error, "Failed to deny application")}
    end
  end

  # Handle real-time updates from Phoenix PubSub
  @impl true
  def handle_info({:application_updated, updated_application}, socket) do
    updated_applications = Enum.map(socket.assigns.applications, fn app ->
      if app.id == updated_application.id, do: updated_application, else: app
    end)

    {:noreply, assign(socket, applications: updated_applications)}
  end

  @impl true
  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <div class="flex flex-row w-full">
      <button phx-click="toggle_sidebar" class="fixed top-4 right-4 lg:hidden z-50 bg-blue-600 p-3 rounded-md text-white">
        ☰
      </button>

      <.aside_bar is_open={@is_sidebar_open} current_user={@current_user} />
      <div class="flex-1 flex-col">
        <.admin_panel current_user={@current_user} />
        <div class="flex-1 p-6">
          <h1 class="text-2xl font-bold mb-4">Job Applications</h1>

          <table class="min-w-full border-collapse border border-gray-300">
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
                  <td class="border p-2"><%= application.type_of_job %></td>
                  <td class="border p-2"><%= application.email %></td>
                  <td class="border p-2"><%= application.phone %></td>
                  <td class="border p-2">
                    <%= case application.status do %>
                      <% "Pending" -> %>
                        <span class="text-yellow-500">Pending</span>
                      <% "Approved" -> %>
                        <span class="text-green-500">Approved</span>
                      <% "Denied" -> %>
                        <span class="text-red-500">Denied</span>
                      <% _ -> %>
                        <span class="text-gray-500">Unknown</span>
                    <% end %>
                  </td>
                  <td class="border p-2">
                    <%= case application.status do %>
                      <% "Pending" -> %>
                        <button phx-click="approve" phx-value-id={application.id} class="bg-blue-500 text-white px-3 py-1 rounded">
                          Approve
                        </button>
                        <button phx-click="deny" phx-value-id={application.id} class="bg-red-500 text-white px-3 py-1 rounded ml-2">
                          Deny
                        </button>
                      <% "Approved" -> %>
                        <span class="text-green-500">Approved</span>
                      <% "Denied" -> %>
                        <span class="text-red-500">Denied</span>
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
