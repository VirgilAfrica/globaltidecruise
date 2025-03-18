defmodule GlobaltideWeb.Admin.AsideBarComponent do
  use Phoenix.Component
  alias Heroicons

  def aside_bar(assigns) do
    ~H"""
    <aside
      class={"fixed lg:relative inset-y-0 left-0 bg-blue-600 h-auto w-80 lg:w-1/4 transform transition-transform duration-300 ease-in-out z-50 overflow-y-auto scrollbar-thin  " <>
      if @is_open, do: "translate-x-0 ", else: "-translate-x-full  md:translate-x-0"}
    >
      <div class="max-w-[90%] mx-auto py-8 md:py-12 space-y-4">
        <div class="flex justify-between items-center">
          <img src="/images/globaltide-lg2.jpeg" alt="Globaltide-admin" class="w-20 h-20">
          <button phx-click="toggle_sidebar" class="lg:hidden text-white text-2xl">✕</button>
        </div>

        <div>
          <h2 class="text-lg md:text-xl font-bold text-gray-200">Main Menu</h2>
        </div>
        <ul class="space-y-4">
          <li class="flex items-center space-x-4 p-4 bg-white rounded-md hover:bg-red-500 hover:text-white transition">
            <Heroicons.icon name="document" class="w-6 h-6" />
            <a href="/applications">View Applications</a>
          </li>
          <%!-- <li class="flex items-center space-x-4 p-4 bg-white rounded-md hover:bg-red-500 hover:text-white transition">
            <Heroicons.icon name="book-open" class="w-6 h-6" />
            <a href="">Open Hiring</a>
          </li> --%>
          <li class="flex items-center space-x-4 p-4 bg-white rounded-md hover:bg-red-500 hover:text-white transition disable-btn">
            <Heroicons.icon name="document-plus" class="w-6 h-6" />
            <a href="#">Add Jobs</a>
          </li>
        </ul>

        <%!-- <h2 class="text-lg md:text-xl font-bold text-white mt-6">Others</h2>
        <ul class="space-y-4">
          <li class="flex items-center space-x-4 p-4 bg-white rounded-md hover:bg-red-500 hover:text-white transition">
            <Heroicons.icon name="user-group" class="w-6 h-6" />
            <a href="">Approved Applicants</a>
          </li>
          <li class="flex items-center space-x-4 p-4 bg-white rounded-md hover:bg-red-500 hover:text-white transition">
            <Heroicons.icon name="user-plus" class="w-6 h-6" />
            <a href="">Admin Account</a>
          </li>
          <li class="flex items-center space-x-4 p-4 bg-white rounded-md hover:bg-red-500 hover:text-white transition">
            <Heroicons.icon name="calendar" class="w-6 h-6" />
            <a href="">Schedule</a>
          </li>
        </ul> --%>

        <h2 class="text-lg md:text-xl font-bold text-white mt-6">Preferences</h2>
        <ul class="space-y-4">
          <li class="flex items-center space-x-4 p-4 bg-white rounded-md hover:bg-red-500 hover:text-white transition">
            <Heroicons.icon name="cog-6-tooth" class="w-6 h-6" />
            <a href="/users/settings">Admin Settings</a>
          </li>
          <%!-- <li class="flex items-center space-x-4 p-4 bg-white rounded-md hover:bg-red-500 hover:text-white transition">
            <Heroicons.icon name="shield-check" class="w-6 h-6" />
            <a href="">Policy Tools</a>
          </li> --%>
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
