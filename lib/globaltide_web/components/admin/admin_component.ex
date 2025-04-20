defmodule GlobaltideWeb.Admin.AdminComponent do
  use Phoenix.Component


  def admin_panel(assigns)do
    ~H"""
      <section class="w-full h-auto mx-auto ">
        <div class=" border-b-[1px]">
          <div class="max-w-[100%] mx-auto  w-full py-4 flex items-center">
            <div class="flex flex-col w-auto">
              <%= if @current_user do %>
              <div class="w-full">
                <div class="flex flex-row items-start justify-start">
                  <h3 class="flex text-[24px] md:text-[32px] font-bold">Welcome back
                    {@current_user.name},
                  </h3>
                </div>
                <div class="flex items-start justify-start">
                  <h4 class="text-[16px] md:text-[24px]">
                  You have <span class=""> {@current_user.role} </span> priviledges
                    </h4>
                </div>
              </div>
              <%else%>
                <div>
                  <h1 class="text-[16px] md:text-[24px] font-bold">You are not logged in</h1>
                  <p class="text-[16px] md:text-[18px] font-medium">Login to access more features</p>
                </div>
              <% end %>
            </div>
          </div>
        </div>
      </section>
    """
  end
end
