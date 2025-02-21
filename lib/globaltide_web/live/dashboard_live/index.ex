defmodule GlobaltideWeb.DashboardLive.Index do
  use GlobaltideWeb, :live_view

  import Phoenix.Component
  import GlobaltideWeb.AsideMenuComponent
  import GlobaltideWeb.DashboardComponent

  @impl Phoenix.LiveView
  def mount(params, _session, socket) do
    socket =
      socket
      |> assign_new(:current_user, fn -> get_current_user(socket) end)
      |> assign(:is_open, false)
      |> assign(:job_id, Map.get(params, "job_id", nil))
      |> assign(:job_title, Map.get(params, "job_title", nil))

    {:ok, socket}
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
    socket.assigns[:current_user] || nil
  end
end
