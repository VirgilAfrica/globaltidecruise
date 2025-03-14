defmodule GlobaltideWeb.ApplicationLive.Show do
  use GlobaltideWeb, :live_view

  alias Globaltide.Applications
  # alias Globaltide.JobListing

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    application = Applications.get_application!(id) |> Globaltide.Repo.preload(:job_listing)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:application, application)}
  end


  defp page_title(:show), do: "Show Application"
  defp page_title(:edit), do: "Edit Application"
end
