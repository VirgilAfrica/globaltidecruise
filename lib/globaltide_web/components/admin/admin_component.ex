defmodule GlobaltideWeb.Admin.AdminComponent do
  use Phoenix.Component


  def admin_panel(assigns)do
    ~H"""
      <section class="w-full h-auto mx-auto ">
        <div class=" border-b-2 shadow-md">
          <div class="max-w-[90%] mx-auto  w-full py-4 flex items-center">
            <div class="flex flex-col w-auto">
              <%= if @current_user do %>
              <div clas>
                <div class="flex flex-row items-center justify-start">

                  <h3 class="flex text-[24px] md:text-[32px] font-bold">Welcome back</h3> <h3 class="text-[24px] md:text-[32px] font-semibold text-red-500 ">
                    {@current_user.name}
                  </h3>
                </div>
                <div class="px-4 space-x-4 flex items-center justify-center">
                  <h4 class="flex-row  text-[16px] md:text-[24px] font-bold flex space-x-4">
                    You have
                   </h4>
                   <p class="text-blue-500 space-x-4 font-bold">
                    {@current_user.role}
                  </p>
                  <h4 class="flex-row  text-[16px] md:text-[24px] font-bold flex space-x-4">
                    Priviledges
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
