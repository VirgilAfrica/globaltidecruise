defmodule GlobaltideWeb.JobLive.Show do
  use GlobaltideWeb, :live_view
  alias Globaltide.Accounts
  import GlobaltideWeb.Job.JobDetailTile
  import GlobaltideWeb.Common.NavbarComponent

  @impl true
  def mount(%{"id" => id}, session, socket) do
    job = Globaltide.Repo.get(Globaltide.JobListing, String.to_integer(id))
    IO.inspect(id, label: "Received Job ID")

    # Fetch user from session token
    current_user =
      case session["user_token"] do
        nil -> nil
        token -> Accounts.get_user_by_session_token(token)
      end

    IO.inspect(current_user, label: "DEBUG: Current User in mount")

    # Initialize is_open state
    {:ok, assign(socket, job: job, current_user: current_user, is_open: false)}
  end

  @impl true
  def handle_event("toggle-menu", _params, socket) do
    # Toggle is_open state
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  @impl true
  def handle_event("apply_now", _params, socket) do
    case socket.assigns.current_user do
      nil -> {:noreply, push_navigate(socket, to: "/users/log_in")}
      _user ->
        {:noreply, push_navigate(socket, to: "/dashboard/applications/new")}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
      <.navbar is_open={@is_open} toggle_event="toggle-menu" current_user={@current_user} />

      <%= if @job do %>
        <.job_tile
          img_ref={@job.img_ref}
          jobRole={@job.job_title}
          jobTag={@job.job_tag}
          longDesc={@job.long_desc}
          btn={@job.btn}
          heading={@job.heading}
          roles={@job.roles}
          req={@job.req}
          minRequirements={@job.min_requirements}
          sideHead={@job.side_head}
          sideLogo={@job.side_logo}
          sideDesc={@job.side_desc}
          current_user={@current_user}
        />

        <div class="my-8 max-w-[90%] mx-auto">
          <%= if @current_user do %>
              <p
                class=" text-[16px] md:text-[18px]  transition duration-300 font-light"
              >
                You can apply successfully
              </p>
          <% else %>

            <p  class="font-bold uppercase">
            You need to login to apply!
            </p>
          <% end %>
        </div>
      <% else %>
        <div class="w-full h-screen flex items-center justify-center">
          <p class="text-4xl font-black">404: Job not found!</p>
        </div>
      <% end %>
    """
  end
end
