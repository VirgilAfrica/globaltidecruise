defmodule GlobaltideWeb.JobLive.Index do
  use GlobaltideWeb, :live_view

  import GlobaltideWeb.JobData
  import GlobaltideWeb.JobAvailableComponent
  import GlobaltideWeb.Common.NavbarComponent
  alias GlobaltideWeb.UserAuth

  @impl true
  def mount(params, session, socket) do
    job_data = all()

    # Extract unique jobTags, handling missing values gracefully
    job_tags =
      job_data
      # Default "Unknown" if jobTag is nil
      |> Enum.map(&(&1.jobTag || "Unknown"))
      |> Enum.uniq()

    # Create filters with "All" as the default option
    filters = [%{name: "All"} | Enum.map(job_tags, fn tag -> %{name: tag} end)]

    socket =
      assign_new(socket, :current_user, fn -> get_current_user(params, session, socket) end)

    socket =
      assign(socket,
        filters: filters,
        active_filter: "All",
        is_open: false
        # jobs: jobs,
      )

    {:ok, socket}
  end

  @impl true
  def handle_event("toggle-menu", _params, socket) do
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  @impl true
  def handle_event("set_filter", %{"filter" => filter_name}, socket) do
    filtered_jobs =
      if filter_name == "All" do
        socket.assigns.all_jobs
      else
        Enum.filter(socket.assigns.all_jobs, fn job ->
          job.jobTag == filter_name
        end)
      end

    # Debugging filter
    IO.inspect(filter_name, label: "Selected Filter")
    # Debugging jobs
    IO.inspect(filtered_jobs, label: "Filtered Jobs")

    {:noreply,
     socket
     |> assign(:active_filter, filter_name)
     |> assign(:job_data, filtered_jobs)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.navbar is_open={@is_open} toggle_event="toggle-menu" current_user={@current_user} />
    <.hero_section />
    <.filter_section filters={@filters} active_filter={@active_filter} />
    <.job_listing id="job_listing" job_data={@job_data} socket={@socket} />
    """
  end

  defp get_current_user(params, session, socket) do
    case session do
      # Avoid error if session is nil
      nil -> nil
      _ -> socket.assigns[:current_user] || UserAuth.fetch_current_user(params, session)
    end
  end
end
