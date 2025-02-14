defmodule GlobaltideWeb.LandingLive.Index do
  use GlobaltideWeb, :live_view

  import GlobaltideWeb.LandingPageComponent

  def mount(_params, _session, socket) do
    {:ok, assign(socket, is_open: false, current_index: 0)}
  end

  def handle_event("toggle-menu", _params, socket) do
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end




  def render(assigns) do
    ~H"""
    <.navbar is_open={@is_open} toggle_event="toggle-menu" />
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
