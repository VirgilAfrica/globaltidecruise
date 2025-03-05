defmodule GlobaltideWeb.LandingLive.Index do
  use GlobaltideWeb, :live_view

  import GlobaltideWeb.LandingPageComponent
  alias Globaltide.Accounts

  def mount(_params, session, socket) do
    # Fetch user from session token
    current_user =
      case session["user_token"] do
        nil -> nil
        token -> Accounts.get_user_by_session_token(token)
      end

    # Initialize is_open state
    {:ok, assign(socket, current_user: current_user, is_open: false, current_index: 0)}
  end

  def handle_event("toggle-menu", _params, socket) do
    # Toggle is_open state
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  def render(assigns) do
    ~H"""
    <.navbar is_open={@is_open} toggle_event="toggle-menu" current_user={@current_user} />
    <.hero_section />
    <.departments />
    <.application_component />
    <.roles />
    <.testimony_component />
    <.team_component />
    <.footer />
    """
  end
end
