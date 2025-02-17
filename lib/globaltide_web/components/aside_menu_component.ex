defmodule GlobaltideWeb.AsideMenuComponent do
  use Phoenix.Component

  def aside_menu_component(assigns) do
    assigns =
      assign(assigns, :nav_links, [
        %{imgSrc:  "", name: "Home", path: "/"},
        %{imgSrc: "", name: "View Jobs Available", path: "/"},
        %{imgSrc: "", name: "Application Status", path: "/"}
      ])

    ~H"""
    <aside class="w-full lg:w-1/5 shadow-md lg:fixed lg:left-0 lg:top-0 lg:h-full lg:z-20 lg:bg-white">
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
        <div class={"absolute  top-0 left-0 bg-white h-screen lg:block " <> if(@is_open, do: "block", else: "hidden")}>
          <div>
            <img src="/images/globaltide-lg2.jpeg" alt="" class="w-20 h-20 rounded-xl mx-auto lg:mt-4" />
          </div>
          <%= for link <- @nav_links do %>
            <a href={link.path} class="block py-2 px-4 lg:py-4 lg:px-8 hover:bg-blue-500 hover:text-white transition-colors">
              <div class="flex items-center">
                <span class="w-6 h-6 mr-4">{link.imgSrc}</span>
                <span class="text-lg font-medium"><%= link.name %></span>
              </div>
            </a>
          <% end %>
        </div>
      </div>
    </aside>
    """
  end
end