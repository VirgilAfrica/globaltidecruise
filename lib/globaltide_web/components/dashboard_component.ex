defmodule GlobaltideWeb.DashboardComponent do
use Phoenix.Component
def dashboard_component(assigns) do
~H"""
<section class="w-full lg:w-4/5  lg:ml-auto lg:h-full">
  <div
    class=" mx-auto flex flex-col lg:py-8 lg:shadow-md"
  >
    <div class="w-full flex lg:flex-row flex-col items-start justify-between max-w-[90%] mx-auto" >
      <div class="flex flex-col">
        <%= if @current_user do %>
        <h1 class="text-[20px] md:text-[24px]">Welcome, <%= @current_user.name %>!</h1>
        <%= if @current_user.role == "admin" do %>
        <p class="font-bold text-[16px] text-[18px]">You have admin privileges.</p>
        <% else %>
        <p class="font-medium text-blue-500 text-[16px] md:text-[18px]">You are a regular user.</p>
        <% end %>
        <% else %>
        <h1>Welcome, Guest!</h1>
        <p>Please log in to access more features.</p>
        <% end %>
      </div>
      <div>
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
  </div>
</section>
"""
end
end
