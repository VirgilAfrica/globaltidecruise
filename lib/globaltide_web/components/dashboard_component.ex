defmodule GlobaltideWeb.DashboardComponent do
  use Phoenix.Component

  def dashboard_component(assigns) do
    ~H"""
    <section class="w-full lg:w-4/5 lg:px-8 lg:ml-auto lg:h-full">
      <div class="max-w-[90%] mx-auto lg:max-w-none flex flex-col lg:py-8">
        <div class="w-full flex lg:flex-row flex-col items-start justify-between">
          <div class="">
            <%= if @current_user do %>
              <h1>Welcome, <%= @current_user.name %>!</h1>
              <!-- Additional logic based on the current user -->
              <%= if @current_user.role == "admin" do %>
                <p>You have admin privileges.</p>
              <% else %>
                <p>You are a regular user.</p>
              <% end %>
            <% else %>
              <h1>Welcome, Guest!</h1>
              <p>Please log in to access more features.</p>
            <% end %>
          </div>
          <div>
            <h1>Hello Dashcam</h1>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
