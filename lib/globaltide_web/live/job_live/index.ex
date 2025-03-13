defmodule GlobaltideWeb.JobLive.Index do
  use GlobaltideWeb, :live_view

  alias Globaltide.Accounts
  alias Globaltide.JobListing
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

    socket = assign_new(socket, :current_user, fn -> get_current_user(socket, session) end)
    # Fetch user from session token
    current_user =
      case session["user_token"] do
        nil -> nil
        token -> Accounts.get_user_by_session_token(token)
      end

    jobs = Globaltide.Repo.all(JobListing)

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
        Globaltide.Repo.all(JobListing)
      else
        Globaltide.Repo.all(JobListing)
        |> Enum.filter(fn job -> job.job_tag == filter_name end)
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
            job_tag={job.job_tag}
            job_role={job.job_title}
            desc={job.short_desc}
            socket={@socket}
          />
        </a>
      <% end %>
    </div>
    """
  end

  defp get_current_user(socket, session) do
    case GlobaltideWeb.UserAuth.fetch_current_user(socket, session) do
      %{assigns: %{current_user: user}} -> user
      _ -> nil
    end
  end

end
