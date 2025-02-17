defmodule GlobaltideWeb.AsideMenuComponent do
  use Phoenix.Component

  def aside_menu_component(assigns) do
    assigns =
      assign(assigns, :nav_links, [
        %{name: "Home", path: "/"},
        %{name: "View Jobs Available", path: "/"},
        %{name: "Application Status", path: "/"}
      ])

    ~H"""
    <aside class="w-full">
      <div class="max-w-[90%] mx-auto">
        <div class="flex flex-row">
          <button phx-click="toggle-menu" class="relative z-30  p-2 border rounded-lg">
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
                  d="M10.5 19.5 3 12m0 0 7.5-7.5M3 12h18"
                />
              </svg>
            <% end %>
          </button>
          <div>
          <div>
            
          </div>
          <div></div>
          <div></div>

            <%!-- <h1 class="text-2xl font-bold">Welcome {@:Current_user}</h1> --%>
          </div>
        </div>
        <div class={"absolute top-0 left-0 bg-white shadow-lg h-screen w-80 py-4 transition-all duration-300 z-20"<> if(@is_open, do: "block", else:  "hidden")}>
          <div>
            <div>
              <img src="/images/globaltide-lg2.jpeg" alt="" class="w-40 h-40 rounded-xl" />
            </div>
            <%= for link <- @nav_links do %>
              <a href={link.path}>
                <ul class="w-full items-start justify-start">
                  <li class="text-[20px] font-medium list-style-none">
                    {link.name}
                  </li>
                </ul>
              </a>
            <% end %>
          </div>
        </div>
      </div>
    </aside>
    """
  end
end
