defmodule GlobaltideWeb.AdminLive.Index do
  use GlobaltideWeb, :live_view

  import GlobaltideWeb.Admin.AdminComponent
  import GlobaltideWeb.Admin.AsideBarComponent


  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns)do
    ~H"""
      <.aside_bar/>
      <.admin_panel/>
    """
  end

end
