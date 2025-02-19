defmodule GlobaltideWeb.AsideMenuComponent do
  use Phoenix.Component

  def aside_menu_component(assigns) do
    assigns =
      assign(assigns, :nav_links, [
        %{imgSrc: "/images/home.png", name: "Home", path: "/"},
        %{imgSrc: "/images/job-search.png", name: "View Jobs Available", path: "/"},
        %{imgSrc: "/images/status.png", name: "Application Status", path: "/"}
      ])

    ~H"""
    <aside class="w-full lg:w-1/5 lg:fixed shadow-md  border-r-2 border-gray-300 lg:left-0 lg:top-0 lg:h-full lg:z-20 lg:bg-white">
      <div class="max-w-[90%] mx-auto">
        <div class="flex flex-row lg:hidden py-4">
          <button phx-click="toggle-menu" class="relative z-30 p-2  border rounded-lg">
            <%= if @is_open do %>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-6 z-30"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"
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
                  d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18"
                />
              </svg>
            <% end %>
          </button>
        </div>
        <div class={"absolute  top-0 left-0 bg-white h-screen lg:block " <> if(@is_open, do: "block", else: "hidden")}>
          <div>
            <img
              src="/images/globaltide-lg2.jpeg"
              alt=""
              class="w-20 h-20 rounded-xl mx-auto lg:mt-4"
            />
          </div>
          <%= for link <- @nav_links do %>
            <a
              href={link.path}
              class="block py-2 p lg:py-4 lg:px-8 hover:bg-blue-500 hover:text-white transition-colors"
            >
              <div class="flex items-center hover:text-white">
                <img src={link.imgSrc} class="w-6 h-6 mr-4 bg-cover" alt={link.name} />
                <span class="text-lg font-medium">{link.name}</span>
              </div>
            </a>
          <% end %>
          <div class=" border-gray-300 border-b-2 py-8 w-full space-y-4 lg:space-y-8">
            <span class="w-full justify-start max-w-[75%] mx-auto flex items-start  border-b-2 border-gray-300 py-4 ">
              <div class="w-6 h-6 mr-4">
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
                    d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z"
                  />
                </svg>
              </div>

              <h3 class="text-lg">User Profile</h3>
            </span>
            <div class="w-full flex py-2 p lg:py-4 lg:px-8 hover:bg-blue-500 hover:text-white transition-color">
              <div class="w-6 h-6 mr-4">
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
                    d="M10.5 6h9.75M10.5 6a1.5 1.5 0 1 1-3 0m3 0a1.5 1.5 0 1 0-3 0M3.75 6H7.5m3 12h9.75m-9.75 0a1.5 1.5 0 0 1-3 0m3 0a1.5 1.5 0 0 0-3 0m-3.75 0H7.5m9-6h3.75m-3.75 0a1.5 1.5 0 0 1-3 0m3 0a1.5 1.5 0 0 0-3 0m-9.75 0h9.75"
                  />
                </svg>
              </div>
              <%= if @current_user do %>
                <.link href="/users/settings" class=" text-zinc-900  hover:text-zinc-700 ">
                  <span class="text-lg font-medium ">
                    profile settings
                  </span>
                </.link>
              <% end %>
            </div>
            <div class="flex py-2 p lg:py-4 lg:px-8 hover:bg-blue-500 hover:text-white transition-color">
              <div class="w-6 h-6 mr-4">
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
                    d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9A6 6 0 0 0 6 9v.75a8.967 8.967 0 0 1-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0M3.124 7.5A8.969 8.969 0 0 1 5.292 3m13.416 0a8.969 8.969 0 0 1 2.168 4.5"
                  />
                </svg>
              </div>
              <div>
                <.link>
                  <span class="text-lg font-medium">
                    Notifications
                  </span>
                </.link>
              </div>
            </div>
          </div>
          <span class="w-full items-center flex justify-start">
            <.link href="/users/log_out" method="delete" class="w-full">
              <button class="py-2 px-4 md:py-3 md:px-6 lg:py-4 lg:px-8 bg-red-500 text-white w-full">
                Logout
              </button>
            </.link>
          </span>
        </div>
      </div>
    </aside>
    """
  end
end
