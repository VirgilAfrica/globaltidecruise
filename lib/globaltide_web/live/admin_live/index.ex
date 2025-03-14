defmodule GlobaltideWeb.AdminLive.Index do
  use GlobaltideWeb, :live_view

  alias Globaltide.Accounts
  import GlobaltideWeb.Admin.AdminComponent
  import GlobaltideWeb.Admin.AsideBarComponent

  @impl true
  def mount(_params, session, socket) do
    # Fetch user from session token
    current_user =
      case session["user_token"] do
        nil -> nil
        token -> Accounts.get_user_by_session_token(token)
      end

    {:ok, assign(socket, current_user: current_user, is_sidebar_open: false)}
  end

  @impl true
  def handle_event("toggle_sidebar", _, socket) do
    {:noreply, assign(socket, is_sidebar_open: !socket.assigns.is_sidebar_open)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex flex-row w-full">
      <button phx-click="toggle_sidebar" class="fixed top-4 right-4 lg:hidden z-50 bg-blue-600 p-3 rounded-md text-white">
        ☰
      </button>

      <.aside_bar is_open={@is_sidebar_open} current_user={@current_user} />

      <div class="flex-1">
        <.admin_panel current_user={@current_user} />
      </div>
    </div>
    """
  end
end
