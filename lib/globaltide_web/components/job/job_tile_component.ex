defmodule GlobaltideWeb.JobTileComponent do
  use Phoenix.Component


  attr :id, :integer, required: true
  attr :img_ref, :string, required: true
  attr :job_tag, :string, required: true
  attr :job_role, :string, required: true
  attr :desc, :string, required: true

  # import GlobaltideWeb.Router.Helpers

  def job_tile(assigns) do
    ~H"""
    <a href={Routes.live_path(@socket, GlobaltideWeb.JobLive.Show, @id)}>
    >
      <div class="w-full h-auto flex flex-col mt-10 items-center justify-evenly space-y-10 cursor-pointer">
        <span class="border-[1px] rounded-xl w-full border-black"></span>
        <div class="flex flex-col md:flex-row lg:flex-row items-center justify-center">
          <div class="flex items-center p-2 lg:p-4 lg:w-1/2">
            <img src={@img_ref} alt={@job_role} class="bg-cover bg-center rounded-3xl" />
          </div>
          <div class="flex flex-col w-full items-start justify-start space-y-2 max-w-[90%] mx-auto lg:p-12">
            <span class="text-[16px] md:text-[20px] lg:text-[24px] font-bold"><%= @job_tag %></span>
            <h1 class="text-blue-700 hover:text-red-700 text-[24px] md:text-[30px] lg:text-[36px]">
              <%= @job_role %>
            </h1>
            <p class="text-[16px] md:text-[16px] lg:text-[20px] text-prettier"><%= @desc %></p>
          </div>
        </div>
      </div>
    </a>
    """
  end

end
