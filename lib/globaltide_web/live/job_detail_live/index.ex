defmodule GlobaltideWeb.JobDetailLive do
  use GlobaltideWeb, :live_view

  import GlobaltideWeb.JobDetailComponent

  def mount(%{"id" => id}, _session, socket) do
    job = find_job(id)

    if job do
      {:ok, assign(socket, job: job)}
    else
      {:ok, assign(socket, error: "Job not found")}
    end
  end

  defp find_job(id) do
    IO.inspect(GlobaltideWeb.JobData.all(), label: "Looking for jobId: #{id}")

    Enum.find(GlobaltideWeb.JobData.all(), fn job ->
      Integer.to_string(job.id) == id
    end)
  end

  def render(assigns) do
    ~H"""
    <%= if @job do %>
      <.job_id_tile
        imgRef={@job.imgRef}
        jobTag={@job.jobTag}
        jobTitle={@job.jobTitle}
        btn={@job.btn}
        longDesc={@job.longDesc}
        heading={@job.heading}
        roles={@job.roles}
        req={@job.req}
        minRequirements={@job.minRequirements}
        sideHead={@job.sideHead}
        sideDesc={@job.sideDesc}
        sideLogo={@job.sideLogo}
      />
    <% else %>
      <p class="text-red-500 text-center mt-10 text-xl">{@error}</p>
    <% end %>
    """
  end
end
