defmodule GlobaltideWeb.AdminLive.Index do
  use GlobaltideWeb, :live_view

  alias Globaltide.Accounts
  alias Globaltide.Applications
  import GlobaltideWeb.Admin.AdminComponent
  import GlobaltideWeb.Admin.AsideBarComponent

  @impl true
  def mount(_params, session, socket) do
    # Fetch user from session token
    current_user =
      case session["user_token"] do
        nil -> nil
        token -> Accounts.get_user_by_session_token(token)
      end

      applications = Applications.list_applications()

    {:ok, assign(socket, current_user: current_user, is_sidebar_open: false, applications: applications)}
  end

  @impl true
  def handle_event("toggle_sidebar", _, socket) do
    {:noreply, assign(socket, is_sidebar_open: !socket.assigns.is_sidebar_open)}
  end

  @impl true
  def handle_event("approve", %{"id" => id}, socket) do
    application = Applications.get_application!(id)

    case Applications.update_application(application, %{approval_status: "approved"}) do
      {:ok, _updated_application} ->
        updated_applications = Applications.list_applications()
        {:noreply, assign(socket, applications: updated_applications, flash: %{info: "Application approved"})}

      {:error, _changeset} ->
        {:noreply, put_flash(socket, :error, "Failed to approve application")}
    end
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
                      <%= if application.approval_status == "pending" do %>
                        <span class="text-yellow-500">Pending</span>
                      <% else %>
                        <span class="text-green-500">Approved</span>
                      <% end %>
                    </td>
                    <td class="border p-2">
                      <%= if application.approval_status == "pending" do %>
                        <button phx-click="approve" phx-value-id={application.id} class="bg-blue-500 text-white px-3 py-1 rounded">
                          Approve
                        </button>
                      <% else %>
                        <span class="text-gray-400">Approved</span>
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
