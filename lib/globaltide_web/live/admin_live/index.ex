defmodule GlobaltideWeb.AdminLive.Index do
  use GlobaltideWeb, :live_view

  import GlobaltideWeb.Admin.AdminComponent
  import GlobaltideWeb.Admin.AsideBarComponent

  @impl true
  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        is_sidebar_open: false,
        current_user: get_current_user(socket)
      )

    {:ok, socket}
  end

  @impl true
  def handle_event("toggle_sidebar", _, socket) do
    {:noreply, assign(socket, :is_sidebar_open, !socket.assigns.is_sidebar_open)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex flex-row w-full">
    <button phx-click="toggle_sidebar" class="fixed top-4 right-4 lg:hidden z-50 bg-blue-600 p-3 rounded-md text-white">
        ☰
      </button>
      <.aside_bar is_open={@is_sidebar_open}  current_user={@current_user}/>


      <div class="flex-1 ">
      <.admin_panel current_user={@current_user} />
      </div>
    </div>
    """
  end

  defp get_current_user(socket) do
    socket.assigns[:current_user]
  end
end
