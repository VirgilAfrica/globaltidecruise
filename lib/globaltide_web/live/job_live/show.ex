defmodule GlobaltideWeb.JobLive.Show do
  use GlobaltideWeb, :live_view
  alias Globaltide.Jobs
  alias Globaltide.Accounts
  import GlobaltideWeb.Job.JobDetailTile

  @impl true
  def mount(%{"id" => id}, session, socket) do
    job = Jobs.get_job_by_id(String.to_integer(id))
    IO.inspect(id,label: "Received Job ID")


    # Fetch user from session token
    current_user =
      case session["user_token"] do
        nil -> nil
        token -> Accounts.get_user_by_session_token(token)
      end

    IO.inspect(current_user, label: "DEBUG: Current User in mount")

    {:ok, assign(socket, job: job, current_user: current_user)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <%= if @job do %>
      <.job_tile
        img_ref={@job.img_ref}
        jobRole={@job.jobTitle}
        jobTag={@job.jobTag}
        longDesc={@job.longDesc}
        btn={@job.btn}
        heading={@job.heading}
        roles={@job.roles}
        req={@job.req}
        minRequirements={@job.minRequirements}
        sideHead={@job.sideHead}
        sideLogo={@job.sideLogo}
        sideDesc={@job.sideDesc}
        current_user={@current_user}
      />

      <div class="mt-4 max-w-[90%] mx-auto">
        <%= if @current_user do %>
              <p
                class=" text-[16px] md:text-[18px]  transition duration-300 font-light"
              >
          You can apply successfully
          </p>
        <% else %>

          <a href="/users/log_in" class="px-6 py-3 bg-gray-500 text-white text-[16px] md:text-[18px] rounded-lg hover:bg-gray-700 transition duration-300">
            Login to Apply
          </a>
        <% end %>
      </div>
    <% else %>
      <div class="w-full h-screen flex items-center justify-center">
        <p class="text-4xl font-black">404: Job not found!</p>
      </div>
    <% end %>
    """
  end

  @impl true
  def handle_event("apply_now", _params, socket) do
    case socket.assigns.current_user do
      nil -> {:noreply, push_navigate(socket, to: "/users/log_in")}
      _user ->
        job_id = socket.assigns.job.id
        {:noreply, push_navigate(socket, to: "/jobs/#{job_id}/dashboard/applications/new")}
    end
  end
end
