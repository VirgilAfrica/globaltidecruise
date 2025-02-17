defmodule GlobaltideWeb.DashboardLive.Index do
  use GlobaltideWeb, :live_view

  import GlobaltideWeb.AsideMenuComponent
  import GlobaltideWeb.DashboardComponent

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket = assign_new(socket, :current_user, fn -> get_current_user(socket) end)
    {:ok, assign(socket, is_open: false)}
  end

  def handle_event("toggle-menu", _params, socket) do
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  def render(assigns) do
    ~H"""
    <section>
      <.aside_menu_component
        is_open={@is_open}
        toggle_event="toggle-menu"
        current_user={@current_user}
      />
      <.dashboard_component />
    </section>
    """
  end

  defp get_current_user(socket) do
    socket.assigns[:current_user] || nil
  end
end
