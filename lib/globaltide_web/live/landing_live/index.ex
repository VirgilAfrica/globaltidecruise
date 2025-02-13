defmodule GlobaltideWeb.LandingLive.Index do
  use GlobaltideWeb, :live_view

  import GlobaltideWeb.LandingPageComponent

  def mount(_params, _session, socket) do
    {:ok, assign(socket, is_open: false)}
  end

  def handle_event("toggle-menu", _params, socket) do
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  def handle_event("next_testimony", _params, socket) do
    testimonies = socket.assigns.testimony_data
    total_testimonies = length(testimonies)

    new_index = rem(socket.assigns.start_index + 2, total_testimonies)

    {:noreply, assign(socket, start_index: new_index)}
  end

  def handle_event("prev_testimony", _params, socket) do
    testimonies = socket.assigns.testimony_data
    total_testimonies = length(testimonies)

    new_index =
      case socket.assigns.start_index - 2 do
        n when n < 0 -> max(0, total_testimonies - 2)
        n -> n
      end

    {:noreply, assign(socket, start_index: new_index)}
  end

  # defp visible_testimonies(assigns) do
  #   assigns.testimony_data
  #   |> Enum.drop(assigns.start_index)
  #   |> Enum.take(2)
  # end

  def render(assigns) do
    ~H"""
    <.navbar is_open={@is_open} toggle_event="toggle-menu" />
    <.hero_section />
    <.departments />
    <.application_component />
    <%!-- <.testimony_component testimonies={visible_testimonies(assigns)} /> --%>
    <.roles />
    <.team_component />
    <.footer />
    """
  end
end
