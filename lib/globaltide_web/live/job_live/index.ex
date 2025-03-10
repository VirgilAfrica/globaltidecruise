defmodule GlobaltideWeb.JobLive.Index do
  use GlobaltideWeb, :live_view

  alias Globaltide.Jobs
  alias Globaltide.Accounts

  import GlobaltideWeb.JobAvailableComponent

  def mount(_params, session, socket) do
    filters = [
      %{name: "All"},
      %{name: "Entertainment"},
      %{name: "Deck Departments"},
      %{name: "Photo Department"},
      %{name: "Galley"},
      %{name: "Restaurant"},
      %{name: "Beverage"},
      %{name: "Guest Service"},
      %{name: "Casino"}
    ]

    # Fetch user from session token
    current_user =
      case session["user_token"] do
        nil -> nil
        token -> Accounts.get_user_by_session_token(token)
      end

    jobs = Jobs.get_jobs()

    socket =
      assign(socket,
        filters: filters,
        active_filter: "All",
        is_open: false,
        jobs: jobs,
        current_user: current_user
      )

    {:ok, socket}
  end

  def handle_event("toggle-menu", _params, socket) do
    # Toggle is_open state
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  def handle_event("set_filter", %{"filter" => filter_name}, socket) do
    filtered_jobs =
      if filter_name == "All" do
        Jobs.get_jobs()
      else
        Jobs.get_jobs()
        |> Enum.filter(fn job -> job.jobTag == filter_name end)
      end

    {:noreply, assign(socket, active_filter: filter_name, jobs: filtered_jobs)}
  end

  def render(assigns) do
    ~H"""
    <.navbar is_open={@is_open} toggle_event="toggle-menu" current_user={@current_user} />
    <.hero_section />
    <.filter_section filters={@filters} active_filter={@active_filter} />

    <div class="job-list max-w-[90%] mx-auto">
      <%= for job <- @jobs do %>
        <a href={~p"/jobs/#{job.id}"} class="block">
          <.job_tile
            id={job.id}
            img_ref={job.img_ref}
            job_tag={job.jobTag}
            job_role={job.jobTitle}
            desc={job.shortDesc}
            socket={@socket}
          />
        </a>
      <% end %>
    </div>
    """
  end
end
