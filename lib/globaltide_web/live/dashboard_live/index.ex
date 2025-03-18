defmodule GlobaltideWeb.DashboardLive.Index do
  use GlobaltideWeb, :live_view

  alias Globaltide.{Accounts, Repo}
  alias Globaltide.Applications.Application

  import Ecto.Query
  import GlobaltideWeb.AsideMenuComponent
  import GlobaltideWeb.DashboardComponent
  import GlobaltideWeb.ApplicationTableComponent

  @impl true
  def mount(_params, session, socket) do
    current_user =
      case Map.get(session, "user_token") do
        nil -> nil
        token -> Accounts.get_user_by_session_token(token)
      end

    applications = fetch_user_applications(current_user)

    # Start polling every 5 seconds
    if connected?(socket), do: Process.send_after(self(), :refresh_applications, 5000)

    IO.inspect(applications, label: "User Applications")

    {:ok,
     assign(socket,
       current_user: current_user,
       is_open: true,
       applications: applications
     )}
  end

  @impl true
  def handle_event("toggle-menu", _params, socket) do
    {:noreply, assign(socket, :is_open, !socket.assigns.is_open)}
  end

  @impl true
  def handle_info(:refresh_applications, socket) do
    applications = fetch_user_applications(socket.assigns.current_user)
    Process.send_after(self(), :refresh_applications, 5000)  # Keep polling every 5 seconds
    {:noreply, assign(socket, :applications, applications)}
  end

  defp fetch_user_applications(nil), do: []
  defp fetch_user_applications(current_user) do
    Repo.all(from a in Application, where: a.user_id == ^current_user.id, preload: [:job_listing])
  end

  @impl true
  def render(assigns) do
    ~H"""
    <section class="flex flex-col lg:flex-row h-auto">
      <div class="lg:hidden relative">
        <div class="lg:hidden absolute top-4 right-4 z-50">
          <button
            phx-click="toggle-menu"
            class="bg-blue-600 text-white px-4 py-2 rounded-md shadow-lg"
          >
            ☰
          </button>
        </div>
      </div>

      <div class="lg:w-1/4">
        <.aside_menu_component
          is_open={@is_open}
          toggle_event="toggle-menu"
          current_user={@current_user}
        />
      </div>

      <div class="lg:w-3/4 flex flex-col justify-center items-center">
        <.dashboard_component current_user={@current_user} />
        <.application_table applications={@applications || []} />
      </div>
    </section>
    """
  end
end
