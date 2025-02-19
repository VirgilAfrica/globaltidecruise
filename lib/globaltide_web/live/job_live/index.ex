defmodule GlobaltideWeb.JobLive.Index do
  use GlobaltideWeb, :live_view

  # Fetching data from the database
  alias Globaltide.Job
  alias Globaltide.Repo

  import GlobaltideWeb.JobAvailableComponent
  import GlobaltideWeb.Common.NavbarComponent
  alias GlobaltideWeb.UserAuth

  def mount(params, session, socket) do
    # Fetch jobs
    jobs = Repo.all(Job)

    IO.inspect(jobs, label: "Fetched Jobs")

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

    socket =
      assign_new(socket, :current_user, fn -> get_current_user(params, session, socket) end)

    socket =
      assign(
        socket,
        filters: filters,
        active_filter: "All",
        is_open: false
        # jobs: jobs,
      )

    {:ok, socket}
  end

  def handle_event("toggle-menu", _params, socket) do
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  def handle_event("set_filter", %{"filter" => filter_name}, socket) do
    socket = assign(socket, active_filter: filter_name)
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <.navbar
      is_open={@is_open}
      toggle_event="toggle-menu"
      current_user={@current_user}
    />
    <.hero_section />
    <.filter_section />
    <.job_listing jobs={@jobs} />
    """
  end

  defp get_current_user(params, session, socket) do
    socket.assigns[:current_user] || UserAuth.fetch_current_user(params, session)
  end


end
