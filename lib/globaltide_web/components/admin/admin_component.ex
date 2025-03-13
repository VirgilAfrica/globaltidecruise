defmodule GlobaltideWeb.Admin.AdminComponent do
  use Phoenix.Component


  def admin_panel(assigns)do
    ~H"""
      <section class="w-4/5">
        <div class=" border-b-2 shadow-md">
          <div class="max-w-[90%] mx-auto  w-full py-4 flex items-center justify-between">
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
                  <p class="text-[16px] md:text-[18px] font-medium">Click <a class="text-blue-500 underline underline-offset-8" href="/users/register">Here</a> to login</p>
                </div>
              <% end %>
            </div>
            <div class="">
              <div>
                <button class="px-4 py-2 md:px-8 md:py-4"></button>
              </div>
              <div mx-4>
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
        </div>
      </section>
    """
  end
end
