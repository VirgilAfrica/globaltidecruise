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
    # Fetch user from session token
    current_user =
      case session["user_token"] do
        nil -> nil
        token -> Accounts.get_user_by_session_token(token)
      end

    applications =
      if current_user do
        Repo.all(from a in Application, where: a.user_id == ^current_user.id)
      else
        []
      end

    IO.inspect(applications, label: "User Applications")  # Debugging output

    {:ok, assign(socket, current_user: current_user, is_open: true, applications: applications)}
  end

  @impl true
  def handle_event("toggle-menu", _params, socket) do
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <section class="relative flex flex-col lg:flex-row min-h-screen">
      <div class="lg:hidden absolute top-4 right-4 z-50">
        <button
          phx-click="toggle-menu"
          class="bg-blue-600 text-white px-4 py-2 rounded-md shadow-lg"
        >
          ☰
        </button>
      </div>

      <.aside_menu_component
        is_open={@is_open}
        toggle_event="toggle-menu"
        current_user={@current_user}
      />

      <div class="relative top-0 lg:flex-1 flex flex-col justify-center items-center">
        <.dashboard_component current_user={@current_user} />
        <.application_table applications={@applications} />
      </div>
    </section>
    """
  end
end
