defmodule GlobaltideWeb.AdminLive.Index do
  use GlobaltideWeb, :live_view

  import GlobaltideWeb.Admin.AdminComponent
  import GlobaltideWeb.Admin.AsideBarComponent

  @impl true
  def mount(_params, _session, socket) do
    socket = assign_new(socket, :current_user, fn -> get_current_user(socket) end)
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex flex-row w-full">
      <.aside_bar current_user={@current_user}/>
      <.admin_panel current_user={@current_user}/>
    </div>
    """
  end

  defp get_current_user(socket) do
    socket.assigns[:current_user ]
  end
end
