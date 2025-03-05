defmodule GlobaltideWeb.DashboardComponent do
use Phoenix.Component
def dashboard_component(assigns) do
~H"""
<section class="w-full lg:w-4/5 px-2 lg:ml-auto lg:h-full">
  <div
    class=" mx-auto flex flex-col lg:py-8 shadow-md"
  >
    <div class="w-full flex lg:flex-row flex-col items-start justify-between">
      <div class="">
        <%= if @current_user do %>
        <h1>Welcome, <%= @current_user.name %>!</h1>
        <%= if @current_user.role == "admin" do %>
        <p>You have admin privileges.</p>
        <% else %>
        <p>You are a regular user.</p>
        <% end %> <% else %>
        <h1>Welcome, Guest!</h1>
        <p>Please log in to access more features.</p>
        <% end %>
      </div>
      <div>
        <button class="bg-red-400 hover:bg-red-700 duration-300 ease-in-out transition-all font-medium text-white px-4 py-2 md:px-6 md:py-3 lg:px-8 lg:py-4 rounded-md">Logout</button>
      </div>
    </div>
  </div>
</section>
"""
end
end
