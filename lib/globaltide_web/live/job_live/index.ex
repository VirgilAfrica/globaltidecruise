defmodule GlobaltideWeb.JobLive.Index do
  use GlobaltideWeb, :live_view

  alias Globaltide.Jobs

  import GlobaltideWeb.JobAvailableComponent

  def mount(_params, session, socket) do
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

    socket = assign_new(socket, :current_user, fn -> get_current_user(socket, session) end)

    jobs = Jobs.get_jobs()

    socket =
      assign(socket,
        filters: filters,
        active_filter: "All",
        is_open: false,
        jobs: jobs
      )

    {:ok, socket}
  end

  def handle_event("toggle-menu", _params, socket) do
    {:noreply, assign(socket, :is_open, !socket.assigns.is_open)}
  end

  def handle_event("set_filter", %{"filter" => filter_name}, socket) do
    filtered_jobs =
      if filter_name == "All" do
        Jobs.get_jobs()
      else
        Jobs.get_jobs()
        |> Enum.filter(fn job -> job.job_tag == filter_name end)
      end

    {:noreply, assign(socket, active_filter: filter_name, jobs: filtered_jobs)}
  end

  def render(assigns) do
    ~H"""
    <.navbar is_open={@is_open} toggle_event="toggle-menu" current_user={@current_user} />
    <.hero_section />
    <.filter_section filters={@filters} active_filter={@active_filter} />
    <.job_list jobs={@jobs}/>
    """
  end

  defp get_current_user(socket, session) do
    case GlobaltideWeb.UserAuth.fetch_current_user(socket, session) do
      %{assigns: %{current_user: user}} -> user
      _ -> nil
    end
  end

end
