defmodule GlobaltideWeb.LandingLive.Index do
  use GlobaltideWeb, :live_view

  import GlobaltideWeb.LandingPageComponent

  def mount(_params, _session, socket) do
    socket = assign_new(socket, :current_user, fn -> get_current_user(socket) end)
    {:ok, assign(socket, is_open: false, current_index: 0)}
  end

  def handle_event("toggle-menu", _params, socket) do
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

  defp get_current_user(socket) do
    socket.assigns[:current_user] || GlobaltideWeb.UserAuth.fetch_current_user(socket)
  end
end
