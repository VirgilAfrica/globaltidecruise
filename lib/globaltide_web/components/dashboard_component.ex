defmodule GlobaltideWeb.DashboardComponent do
use Phoenix.Component
def dashboard_component(assigns) do
~H"""
<section class="w-full lg:ml-auto ">
  <div
    class=" mx-auto flex flex-col border-b-2 border-grey-400 py-4 lg:py-8 lg:shadow-md"
  >
    <div class="w-full flex lg:flex-row flex-col items-start justify-between max-w-[90%] mx-auto" >
      <div class="flex flex-col">
        <%= if @current_user do %>
        <h1 class="text-[20px] md:text-[24px]">Welcome, <%= @current_user.name %>!</h1>
        <%= if @current_user.role == "User" do %>
        <p class="font-bold text-[16px] text-[18px]">Check your job applications</p>
        <% else %>
        <p class="font-medium text-blue-500 text-[16px] md:text-[18px]">You are an admin. Click
        <a href="/admin" class="text-red-400"> here</a> for redirect</p>
        <% end %>
        <% else %>
        <h1>Welcome, Guest!</h1>
        <p>Please log in to access more features.</p>
        <% end %>
      </div>
      <div>

      </div>
    </div>
  </div>
</section>
"""
end
end
