defmodule GlobaltideWeb.DashboardLive.Index do
  use GlobaltideWeb, :live_view

  import GlobaltideWeb.AsideMenuComponent
  import GlobaltideWeb.DashboardComponent

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket = assign_new(socket, :current_user, fn -> get_current_user(socket) end)
    {:ok, assign(socket, is_open: false)}
  end

  @impl true
  def handle_event("toggle-menu", _params, socket) do
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <section class="flex flex-col lg:flex-row">
      <.aside_menu_component
        is_open={@is_open}
        toggle_event="toggle-menu"
        current_user={@current_user}
      />
      <.dashboard_component current_user={@current_user} />
    </section>
    """
  end

  defp get_current_user(socket) do
    socket.assigns[:current_user] || %{name: "Viktor chevkosv", role: "admin"}
  end
end
