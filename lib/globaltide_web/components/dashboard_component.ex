defmodule GlobaltideWeb.DashboardComponent do
  use Phoenix.Component
  def dashboard_component(assigns)do
    ~H"""
    <section class="w-full h-screen">
      <div class="max-w-[90%] mx-auto">
        <div>
          <h1>Welcome to the dashboard</h1>
        </div>
        <div>
          <h1>Hello Dashcam</h1>
        </div>

      </div>
    </section>
    """
  end
end
