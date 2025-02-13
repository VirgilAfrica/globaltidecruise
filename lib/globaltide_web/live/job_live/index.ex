defmodule GlobaltideWeb.JobLive.Index do
  use Phoenix.Component

  import GlobaltideWeb.JobAvailableComponent

  def render(assigns) do
    ~H"""
    <.navbar />
    """
  end
end
