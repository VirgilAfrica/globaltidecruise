defmodule GlobaltideWeb.AsideMenuComponent do
  use Phoenix.Component

  def aside_menu_component(assigns) do
    assigns =
      assign(assigns, :nav_links, [
        %{imgSrc: "/images/home.png", name: "Home", path: "/"},
        %{imgSrc: "/images/job-search.png", name: "View Jobs Available", path: "/jobs"},
        %{
          imgSrc: "/images/status.png",
          name: "Application  status",
          path: "/dashboard/application-status"
        },
        %{
          imgSrc: "/images/apply.png",
          name: "Fill Application",
          path: "/applications"
        }
      ])

    ~H"""
    <aside class="lg:w-1/4 lg:sticky shadow-sm lg:left-0 lg:top-0 lg:h-full lg:z-20 lg:bg-white">
      <div class="max-w-[100%] mx-auto">
        <div class="flex flex-row lg:hidden py-4">
          <button phx-click="toggle-event" class="relative z-50 p-2 border rounded-lg">
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
                  d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18"
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

        <div class={"fixed top-0 left-0 w-3/4 max-w-xs h-full bg-white shadow-lg transform transition-transform duration-300 ease-in-out " <>
          if(@is_open, do: "translate-x-0", else: "-translate-x-full") <> " lg:translate-x-0 lg:relative lg:w-full lg:block"}>
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
              class="block py-2 lg:py-4 lg:px-8 hover:bg-blue-500 hover:text-white transition-colors"
            >
              <div class="flex items-center">
                <img src={link.imgSrc} class="w-6 h-6 mr-4 bg-cover" alt={link.name} />
                <span class="text-lg font-medium">{link.name}</span>
              </div>
            </a>
          <% end %>

          <div class="border-gray-300 py-8 w-full space-y-4 lg:space-y-8">
            <span class="w-full flex items-start border-b-2 border-gray-300 py-4 px-4">
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
                    d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z"
                  />
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z"
                  />
                </svg>
              </div>
              <h3 class="text-lg">User Profile</h3>
            </span>

            <div class="flex py-2 px-4 lg:py-4 lg:px-8 hover:bg-blue-500 hover:text-white transition-color">
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
                    d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.325.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 0 1 1.37.49l1.296 2.247a1.125 1.125 0 0 1-.26 1.431l-1.003.827c-.293.241-.438.613-.43.992a7.723 7.723 0 0 1 0 .255c-.008.378.137.75.43.991l1.004.827c.424.35.534.955.26 1.43l-1.298 2.247a1.125 1.125 0 0 1-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.47 6.47 0 0 1-.22.128c-.331.183-.581.495-.644.869l-.213 1.281c-.09.543-.56.94-1.11.94h-2.594c-.55 0-1.019-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 0 1-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 0 1-1.369-.49l-1.297-2.247a1.125 1.125 0 0 1 .26-1.431l1.004-.827c.292-.24.437-.613.43-.991a6.932 6.932 0 0 1 0-.255c.007-.38-.138-.751-.43-.992l-1.004-.827a1.125 1.125 0 0 1-.26-1.43l1.297-2.247a1.125 1.125 0 0 1 1.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.086.22-.128.332-.183.582-.495.644-.869l.214-1.28Z"
                  />
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"
                  />
                </svg>
              </div>

              <span class="w-full">
                <%= if @current_user do %>
                  <.link href="/users/settings" class="block">
                    <button class="">
                      Customise   profile
                    </button>
                  </.link>
                <% else %>
                  <a href="/users/log_in">
                    <button class="">
                      Did you login?
                    </button>
                  </a>
                <% end %>
              </span>
            </div>

            <div class="flex py-2 px-4 lg:py-4 lg:px-8 hover:bg-blue-500 hover:text-white transition-color">
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
              <span class="text-lg font-medium">Notifications</span>
            </div>
          </div>

          <span class="w-full">
            <%= if @current_user do %>
              <.link href="/users/log_out" method="delete" class="block">
                <button class="w-full font-bold text-white bg-red-500 px-8 py-4 hover:bg-red-700 transition-colors">
                  Logout
                </button>
              </.link>
            <% else %>
              <a href="/users/log_in">
                <button class="w-full font-bold text-white bg-red-500 px-8 py-4 hover:bg-red-700 transition-colors">
                  Login
                </button>
              </a>
            <% end %>
          </span>
        </div>
      </div>
    </aside>
    """
  end
end
