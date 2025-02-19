defmodule GlobaltideWeb.LandingLive.Index do
  use GlobaltideWeb, :live_view

  alias Globaltide.Accounts
  import GlobaltideWeb.LandingPageComponent
  import GlobaltideWeb.Common.NavbarComponent

  def mount(_params, session, socket) do

    IO.inspect session

    current_user = if session["user_token"] do
      Accounts.get_user_by_session_token(session["user_token"])
    else
      nil
    end

    {:ok, assign(socket, is_open: false, current_index: 0, current_user: current_user)}
  end

  def handle_event("toggle-menu", _params, socket) do
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  def render(assigns) do
    ~H"""
    <.navbar is_open={@is_open} toggle_event="toggle-menu" current_user={nil} />
    <.hero_section />
    <.departments />
    <.application_component />
    <.roles />
    <.testimony_component />
    <.team_component />
    <.footer />
    """
  end

  def get_current_user(params, session, socket) do
    socket.assigns[:current_user] || GlobaltideWeb.UserAuth.fetch_current_user(params, session)
  end
end
