defmodule GlobaltideWeb.AsideMenuComponent do
  use Phoenix.Component
  alias Heroicons

  def aside_menu_component(assigns) do
    ~H"""
    <aside
      class={"bg-blue-600 h-full lg:h-auto fixed inset-y-0 left-0 transition-transform duration-300 ease-in-out z-50 " <>
      if @is_open, do: "translate-x-0 w-3/4  lg:w-1/4 overflow-y-auto", else: "-translate-x-full lg:translate-x-0"}
    >
      <div class="p-6 space-y-6">
        <div class="flex justify-between items-center">
          <img src="/images/globaltide-lg2.jpeg" alt="Globaltide-admin" class="w-16 h-16">
          <button phx-click={@toggle_event} class="lg:hidden text-white text-2xl">✕</button>
        </div>

        <h2 class="text-gray-200 text-lg font-bold">Main Menu</h2>
        <ul class="space-y-4">
          <li class="flex items-center space-x-4 p-4 bg-white rounded-md hover:bg-red-500 hover:text-white transition">
            <Heroicons.icon name="home" class="w-6 h-6" />
            <a href="/">Homepage</a>
          </li>
          <li class="flex items-center space-x-4 p-4 bg-white rounded-md hover:bg-red-500 hover:text-white transition">
            <Heroicons.icon name="document-check" class="w-6 h-6" />
            <a href="/applications/show">Application Status</a>
          </li>
          <li class="flex items-center space-x-4 p-4 bg-white rounded-md hover:bg-red-500 hover:text-white transition">
            <Heroicons.icon name="briefcase" class="w-6 h-6" />
            <a href="/jobs">Apply Jobs</a>
          </li>
        </ul>

        <h2 class="text-gray-200 text-lg font-bold">Preferences</h2>
        <ul class="space-y-4">

          <li class="flex items-center space-x-4 p-4 bg-white rounded-md hover:bg-red-500 hover:text-white transition">
            <%= if @current_user do %>
            <Heroicons.icon name="cog" class="w-6 h-6" />
            <a href="/users/settings">User Settings</a>
            <% else %>
            <p class="uppercase font-semibold text-[14px] lg:text-[16px]">log in to use this feature</p>
            <% end %>
          </li>
          <li class="flex items-center space-x-4 p-4 bg-white rounded-md hover:bg-red-500 hover:text-white transition">
            <Heroicons.icon name="share" class="w-6 h-6" />
            <a href="/copy">Share</a>
          </li>

        </ul>
        <div class="w-full">
          <%= if @current_user do %>
          <.link href="/users/log_out" method="delete" class="block">
                <button class="w-full font-bold text-white bg-red-500 p-4 hover:bg-red-700 transition-colors">
                  Logout
                </button>
              </.link>
          <% else %>
            <a href="/users/log_in">
              <button class="font-bold text-white rounded-xl transition-colors ease-linear hover:bg-red-700 bg-red-500 w-full p-4">
                Login
              </button>
            </a>
          <% end %>
        </div>
      </div>
    </aside>
    """
  end
end
