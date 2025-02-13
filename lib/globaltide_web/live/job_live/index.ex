defmodule GlobaltideWeb.JobLive.Index do
  use GlobaltideWeb, :live_view

  import GlobaltideWeb.JobAvailableComponent

  def mount(_params, _session, socket) do
    {:ok, assign(socket, is_open: false)}
  end

  def render(assigns) do
    ~H"""
    <.navbar is_open={@is_open} toggle_event="toggle-menu" />
    
    """
  end
end
