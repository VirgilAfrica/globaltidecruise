defmodule GlobaltideWeb.JobLive.Index do
  use GlobaltideWeb, :live_view

  import GlobaltideWeb.JobAvailableComponent

  def mount(_params, _session, socket) do
    filters = [
      %{name: "All"},
      %{name: "Entertainment"},
      %{name: "Deck Department"},
      %{name: "Photo Department"},
      %{name: "Galley"},
      %{name: "Restaurant"},
      %{name: "Beverage"},
      %{name: "Guest Service"},
      %{name: "Casino"}
    ]

    socket = assign(socket, filters: filters, active_filter: "All", is_open: false)

    {:ok, socket}
  end

  def handle_event("set_filter", %{"filter" => filter_name}, socket) do
    socket = assign(socket, active_filter: filter_name)
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <.navbar is_open={@is_open} toggle_event="toggle-menu" />
    <.hero_section />
    <.filter_section />
    """
  end
end
