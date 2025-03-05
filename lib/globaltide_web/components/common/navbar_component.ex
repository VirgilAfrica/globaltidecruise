defmodule GlobaltideWeb.Common.NavbarComponent do
  use Phoenix.Component


  def navbar(assigns) do
    assigns =
      assign(assigns, :nav_links, [
        %{name: "Home", path: "/"},
        %{name: "Jobs Available", path: "/jobs"},
        %{name: "Contact", path: "/contact"}
      ])

    ~H"""
    <nav class="w-full h-auto lg:shadow-sm border-b-2 border-blue-100 lg:border-none relative">
      <div class="hidden max-w-[90%] mx-auto lg:flex flex-row items-center justify-evenly">
        <div class="w-full flex items-center">
          <img src="/images/globaltide-lg2.jpeg" alt="" class="w-20 h-20 rounded-full" />
        </div>
        <div class="w-full flex items-center justify-center">
          <ul class="w-full flex flex-row items-center justify-evenly">
            <%= for link <- @nav_links do %>
              <li class="text-[20px] font-medium">
                <a href={link.path}>
                  {link.name}
                </a>
              </li>
            <% end %>
          </ul>
        </div>
        <div class="grid justify-items-end w-full">
          <%= if @current_user do %>
            <form action="/users/log_out" method="post">
              <input type="hidden" name="_method" value="delete" />
              <button
                type="submit"
                class="font-bold text-white rounded-xl transition-colors ease-linear hover:bg-red-700 bg-red-500 lg:px-8 py-4"
              >
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
        <div>
          <button phx-click="toggle-menu" class="z-20 lg-hidden p-2 border rounded-lg">
            <%= if @is_open do %>
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                <path stroke-linecap="round" stroke-linejoin="round" d="m9.75 9.75 4.5 4.5m0-4.5-4.5 4.5M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
              </svg>
            <% else %>
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
              </svg>
            <% end %>
          </button>
        </div>
      </div>

      <div class={"absolute bg-white shadow-md z-20 top-25 lg:hidden w-full p-4 transition-all duration-500 ease-in-out transform " <>
                   if(@is_open, do: "opacity-100 translate-y-0", else: "opacity-0 -translate-y-5 pointer-events-none")}>
        <ul class="flex flex-col items-start justify-evenly space-y-4 text-center">
          <%= for link <- @nav_links do %>
            <li class="text-[20px] font-medium">
              <a href={link.path}>
                {link.name}
              </a>
            </li>
          <% end %>
        </ul>
        <div class="flex flex-col space-y-4 mt-4 w-full">
          <%= if @current_user do %>
          <.link href="/users/log_out" method="delete" class="block">
                <button class="w-full font-bold text-white bg-red-500 px-8 py-4 hover:bg-red-700 transition-colors">
                  Logout
                </button>
              </.link>
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
end
