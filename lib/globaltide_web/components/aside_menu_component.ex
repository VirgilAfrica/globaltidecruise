defmodule GlobaltideWeb.AsideMenuComponent do
  use Phoenix.Component

  def aside_menu_component(assigns) do
    assigns =
      assign(assigns, :nav_links, [
        %{icon:  "/images/logos/home.png", name: "Home", path: "/"},
        %{icon: "/images/logos/briefcase.png", name: "View Jobs Available", path: "/jobs"},
        %{icon: "/images/logos/loading.png", name: "Application Status", path: "/dashboard/applications/:id"},
        %{icon: "/images/logos/apply.png", name: "Apply Today", path: "/dashboard/applications/new"}

      ])

    ~H"""
    <aside class="w-full bg-white lg:w-1/5 shadow-md lg:fixed lg:left-0 lg:top-0 lg:h-full lg:z-20 lg:bg-blue-400">
      <div class="max-w-[90%] mx-auto">
        <div class="flex flex-row lg:hidden py-4">
          <button phx-click="toggle-menu" class="relative z-30 p-2  border rounded-lg">
            <%= if @is_open do %>
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 z-30">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
              </svg>
            <% else %>
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18" />
              </svg>
            <% end %>
          </button>
        </div>
        <div class={"lg:w-full flex items-start   absolute  top-0 left-0 bg-blue-400 h-screen lg:block " <> if(@is_open, do: "block", else: "hidden")}>
          <div class="flex items-start w-full">
            <img src="/images/globaltide-lg2.jpeg" alt="" class="w-auto h-24 rounded-md mx-auto lg:my-4 flex" />
          </div>
          <%= for link <- @nav_links do %>
            <a href={link.path} class="block py-2 px-4 lg:py-4 lg:px-8 hover:bg-red-500 hover:text-white transition-colors">
              <div class="flex items-center ">
                <img src={link.icon} alt={link.icon} class="w-6 h-6 mr-4 "/>
                <span class="text-lg font-medium"><%= link.name %></span>
              </div>
            </a>
          <% end %>
        </div>
        <div class="flex flex-col">

        </div>
      </div>
    </aside>
    """
  end
end
