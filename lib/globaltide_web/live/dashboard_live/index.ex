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

      applications =
        if current_user do
          Repo.all(from a in Application, where: a.user_id == ^current_user.id, preload: [:job_listing])
        else
          []
        end


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
