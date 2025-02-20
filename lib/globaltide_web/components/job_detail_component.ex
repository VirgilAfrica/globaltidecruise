defmodule GlobaltideWeb.JobDetailComponent do
  use Phoenix.Component

  def job_id_tile(assigns) do
    ~H"""
    <section class="w-full mx-auto">
      <div class="w-full max-w-[90%] mx-auto flex flex-col">
        <div
          class="relative w-full h-[500px] flex items-center justify-center p-8 bg-cover bg-fixed bg-center text-white text-center rounded-3xl max-w-[100%] mx-auto"
          style={"background-image: url(#{@imgRef});"}
        >
          <div class="inset-0 absolute bg-gradient-to-r from-blue-500/50 to-red-500/50 rounded-3xl">
          </div>
          <h1 class="relative text-[24px] md:text-[30px] lg:text-[36px] font-bold">
            {@jobTitle}
          </h1>
        </div>
      </div>

      <div class="flex flex-col lg:flex-row max-w-[90%] mx-auto">
        <div class="flex flex-col w-full items-start justify-start p-8 space-y-6">
          <span class="text-[16px] md:text-[20px] lg:text-[24px] font-bold text-gray-700">
            {@jobTag}
          </span>

          <h2 class="text-blue-500 text-[24px] md:text-[28px] lg:text-[32px] font-bold">
            {@jobTitle}
          </h2>

          <a href="/dashboard"> customise this to fit the user form and job
            <button
              phx-click="apply_for_job"
              phx-value-job={@jobTitle}
              class="mt-4 px-6 py-3 bg-red-500 text-white text-[16px] md:text-[18px] rounded-lg hover:bg-blue-600 transition duration-300"
            >
              {@btn}
            </button>
          </a>

          <div class="space-y-4">
            <%= for desc <- @longDesc do %>
              <p class="text-[16px] md:text-[18px] text-gray-800">
                {desc}
              </p>
            <% end %>
          </div>

          <h3 class="text-[20px] md:text-[22px] lg:text-[24px] font-bold text-gray-700">
            {if @heading, do: Enum.at(@heading, 0, "Responsibilities")}
          </h3>
          <ul class="list-disc list-inside text-gray-800 space-y-2">
            <%= for role <- @roles do %>
              <li class="text-[16px] md:text-[18px]">
                {role}
              </li>
            <% end %>
          </ul>

          <h3 class="text-[20px] md:text-[22px] lg:text-[24px] font-bold text-gray-700">
            {if @heading, do: Enum.at(@heading, 1, "Minimum Requirements")}
          </h3>
          <ul class="list-disc list-inside text-gray-800 space-y-2">
            <%= for requirement <- @minRequirements do %>
              <li class="text-[16px] md:text-[18px]">
                {requirement}
              </li>
            <% end %>
          </ul>
        </div>

        <div class="md:w-full lg:w-[40%]">
          <div class="flex items-center justify-center my-10 bg-blue-700 p-8">
            <h1 class="text-[30px] text-white font-bold">{@req}</h1>
          </div>

          <div class="flex flex-row gap-0">
            <div class="flex flex-col items-center justify-evenly w-[20%] space-y-4">
              <%= for {logo, idx} <- Enum.with_index(@sideLogo) do %>
                <img src={logo} alt={"Logo #{idx + 1}"} class="w-12 h-12 object-contain" />
              <% end %>
            </div>

            <div class="flex flex-col space-y-6 w-[90%]">
              <%= for {title, idx} <- Enum.with_index(@sideHead) do %>
                <div class="flex flex-col space-y-2">
                  <h2 class="text-[24px] font-semibold">{title}</h2>
                  <p class="text-[20px] text-gray-700">
                    {Enum.at(@sideDesc, idx, "Description not available")}
                  </p>
                </div>
              <% end %>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
