defmodule GlobaltideWeb.DashboardLive.Index do
  use GlobaltideWeb, :live_view

  alias GlobaltideWeb.AsideMenuComponent
  alias GlobaltideWeb.DashboardComponent

  import GlobaltideWeb.AsideMenuComponent
  import GlobaltideWeb.DashboardComponent

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :current_user, get_current_user(socket))}
  end

  def render(assigns) do
    ~H"""
    <section>
      <.aside_menu_component />
      <.dashboard_component />
    </section>
    """
  end

  defp get_current_user(socket) do
    socket.assigns[:current_user] || nil
  end
end
