defmodule GlobaltideWeb.JobAvailableComponent do
  use Phoenix.Component
  def navbar(assigns) do
    assigns =
      assign(assigns, :nav_links, [
        %{name: "Home", path: "/"},
        %{name: "Jobs Available", path: "/jobs"},
        %{name: "Contact", path: "/contact"}
      ])

    ~H"""
    <nav class="w-full h-auto lg:shadow-sm border-b-2 border-blue-100 lg:border-none">
      <div class="hidden max-w-[90%] mx-auto lg:flex flex-row items-center justify-evenly">
        <div class="w-full flex items-center">
          <img src="/images/globaltide-lg2.jpeg" alt="" class="w-20 h-20 rounded-full" />
        </div>
        <div class="w-full flex items-center justify-center">
          <ul class="w-full flex flex-row items-center justify-evenly">
            <%= for link <- @nav_links do %>
              <li class="text-[20px] font-medium">
                <a href={link.path}>
                  <%= link.name %>
                </a>
              </li>
            <% end %>
          </ul>
        </div>
        <div class="grid justify-items-end w-full">
          <%= if @current_user do %>
            <form action="/users/log_out" method="post">
              <input type="hidden" name="_method" value="delete">
              <button type="submit" class="font-bold text-white rounded-xl transition-colors ease-linear hover:bg-red-700 bg-red-500 lg:px-8 py-4">
                Logout
              </button>
            </form>
          <% else %>
            <a href="/users/log_in">
              <button class="font-bold text-white rounded-xl transition-colors ease-linear hover:bg-red-700 bg-red-500 lg:px-8 py-4">
                Login
              </button>
            </a>
          <% end %>
        </div>
      </div>

      <div class="flex lg:hidden w-full max-w-[90%] mx-auto justify-between items-center flex-row">
        <div class="w-full h-auto max-w-[90%] mx-auto">
          <img src="/images/globaltide-lg2.jpeg" alt="" class="w-20 h-20 rounded-full" />
        </div>
        <div class="">
          <button phx-click="toggle-menu" class="z-20 lg-hidden p-2 border rounded-lg">
            <%= if @is_open do %>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-6"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="m9.75 9.75 4.5 4.5m0-4.5-4.5 4.5M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"
                />
              </svg>
            <% else %>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-6"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"
                />
              </svg>
            <% end %>
          </button>
        </div>
      </div>

      <div class={"absolute bg-white shadow-md top-25 lg:hidden w-full p-4 transition-all duration-300 z-20 " <> if(@is_open, do: "block", else: "hidden")}>
        <ul class="flex flex-col items-start justify-evenly space-y-4 text-center">
          <%= for link <- @nav_links do %>
            <li class="text-[20px] font-medium">
              <a href={link.path}>
                <%= link.name %>
              </a>
            </li>
          <% end %>
        </ul>
        <div class="flex flex-col space-y-4 mt-4 w-full">
          <%= if @current_user do %>
            <form action="/users/log_out" method="post">
              <input type="hidden" name="_method" value="delete">
              <button type="submit" class="font-bold text-white rounded-xl transition-colors ease-linear hover:bg-red-700 bg-red-500 px-8 py-4">
                Logout
              </button>
            </form>
          <% else %>
            <a href="/users/log_in">
              <button class="font-bold text-white rounded-xl transition-colors ease-linear hover:bg-red-700 bg-red-500 px-8 py-4">
                Login
              </button>
            </a>
          <% end %>
        </div>
      </div>
    </nav>
    """
  end

  def hero_section(assigns) do
    ~H"""
    <section>
      <div
        class="relative bg-cover bg-bottom w-full h-[300px] md:h-[400px] lg:h-[500px] bg-fixed"
        style="background-image: url(/images/hero-cruise.jpeg);"
      >
        <div class="absolute bg-black/50 inset-0"></div>
        <div class="relative w-full h-full items-center justify-center flex flex-col px-4 text-center">
          <h1 class="text-[32px] sm:text-[48px] md:text-[72px] font-black text-white leading-tight">
            Join Our Crew
          </h1>
          <p class="text-[16px] md:text-[20px] lg:text-[24px] text-white mt-2 lg:mt-4 max-w-[90%] lg:max-w-[80%] md:max-w-[80%] mx-auto">
            Discover thrilling job opportunities at sea with Global Tide Cruise
            LTD and embark on your adventure.
          </p>
        </div>
      </div>
    </section>
    """
  end

  def filter_section(assigns) do
    ~H"""
    <section>
      <div class="flex flex-col max-w-[90%] mx-auto">
        <div class="w-full">
          <h1 class="text-[24px] md:text-[30px] lg:text-[48px] font-black uppercase">
            Click to Filter by Departments
          </h1>
        </div>
        <div class="grid grid-cols-2 gap-4 lg:grid-cols-5 lg:gap-6 flex-wrap">
          <%!-- <%= for filter <- @filters do %>
            <button
              phx-click="set_filter"
              phx-value-filter={filter.name}
              class={
                if @active_filter == filter.name do
                  "bg-blue-300 text-white shadow-lg px-4 py-2 rounded-3xl text-[16px] lg:text-[24px] font-medium"
                else
                  "bg-gray-200 text-gray-600 hover:bg-blue-500 hover:text-white px-4 py-2 rounded-3xl text-[16px] lg:text-[24px] font-medium"
                end
              }
            >
              <%= filter.name %>
            </button>
          <% end %> --%>
        </div>
      </div>
    </section>
    """
  end


  def job_listing(assigns) do
  ~H"""
  <section class="w-full">
    <div class="max-w-[90%] mx-auto">
      <%= if @jobs == [] do %>
        <p>No jobs found.</p>
      <% else %>
        <%= for job <- @jobs do %>
          <.job_tile
            imgRef={job.imgRef}
            jobTag={job.jobTag}
            jobRole={job.jobTitle}
            desc={job.shortDesc}
          />
        <% end %>
      <% end %>
    </div>
  </section>
  """
end



  def job_tile(assigns) do
  ~H"""
  <div class="w-full h-auto flex flex-col mt-10 items-center justify-evenly space-y-10 cursor-pointer border-t-2 border-black">
    <span class="border-[1px] rounded-xl w-full border-black"></span>
    <div class="flex flex-col md:flex-row lg:flex-row items-center justify-center">
      <div class="flex items-center p-2 lg:p-4 lg:w-1/2">
        <img src={@imgRef} alt={@jobRole} class="bg-cover bg-center rounded-3xl" />
      </div>
      <div class="flex flex-col w-full items-start justify-start space-y-2 max-w-[90%] mx-auto lg:p-12">
        <span class="text-[16px] md:text-[20px] lg:text-[24px] font-bold">
          <%= @jobTag %>
        </span>
        <h1 class="text-blue-700 hover:text-red-700 text-[24px] md:text-[30px] lg:text-[36px]">
          <%= @jobRole %>
        </h1>
        <p class="text-[16px] md:text-[16px] lg:text-[20px] text-prettier">
          <%= @desc %>
        </p>
      </div>
    </div>
  </div>
  """
end

end
