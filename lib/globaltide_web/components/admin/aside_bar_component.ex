defmodule GlobaltideWeb.Admin.AsideBarComponent do
  use Phoenix.Component
  alias Heroicons
  def aside_bar(assigns)do
    ~H"""
    <aside class="w-1/4 bg-blue-600 h-auto">
      
      <div class="max-w-[90%] mx-auto py-8 md:py-12">
        <div class="flex items-start justify-start">
          <img src="/images/globaltide-lg2.jpeg" alt="Globaltide-admin" class="w-20 h-20">
        </div>
        <div class="">
          <h2 class="text-[24px] md:text-[32px] font-bold text-white text-start">Main Menu</h2>
        </div>
        <div class="space-y-4">
          <ul class="space-y-4 flex flex-col" >
            <a href="">
              <li class="flex flex-row space-x-4 items-center bg-white rounded-md p-4 md:p-6 hover:bg-red-500 hover:text-white duration-300 ease-out">
                <Heroicons.icon name="document" class="w-8 h-8" />
                <p class="text-[16px] md:text-[18px]">View Applications</p>
              </li>
            </a>
            <a href="">
              <li class="flex flex-row space-x-4 items-center bg-white rounded-md p-4 md:p-6 hover:bg-red-500 hover:text-white duration-300 ease-out">                <Heroicons.icon name="book-open" class="w-8 h-8" />
                <p class="text-[16px] md:text-[18px]">Open Hiring</p>

              </li>
            </a>
            <a href="">
              <li class="flex flex-row space-x-4 items-center bg-white rounded-md p-4 md:p-6 hover:bg-red-500 hover:text-white duration-300 ease-out">                <Heroicons.icon name="document-plus"  class="w-8 h-8" />
                <p class="text-[16px] md:text-[18px]">Add Jobs</p>

              </li>
            </a>
          </ul>
        </div>
        <div>
          <h1 class="text-[24px] md:text-[32px] font-bold text-white text-start">Others</h1>        
        </div>
        <div class="space-y-4">
          <ul class="space-y-4 flex flex-col" >
            <a href="">
              <li class="flex flex-row space-x-4 items-center bg-white rounded-md p-4 md:p-6 hover:bg-red-500 hover:text-white duration-300 ease-out">
                <Heroicons.icon name="user-group" class="w-8 h-8" />
                <p class="text-[16px] md:text-[18px]">Approved Applicants</p>
              </li>
            </a>
            <a href="">
              <li class="flex flex-row space-x-4 items-center bg-white rounded-md p-4 md:p-6 hover:bg-red-500 hover:text-white duration-300 ease-out">                <Heroicons.icon name="user-plus" class="w-8 h-8" />
                <p class="text-[16px] md:text-[18px]">Admin Account</p>

              </li>
            </a>
            <a href="">
              <li class="flex flex-row space-x-4 items-center bg-white rounded-md p-4 md:p-6 hover:bg-red-500 hover:text-white duration-300 ease-out">                <Heroicons.icon name="calendar"  class="w-8 h-8" />
                <p class="text-[16px] md:text-[18px]">Schedule</p>
              </li>
            </a>
          </ul>
        </div>
        <div>
          <h1 class="text-[24px] md:text-[32px] font-bold text-white text-start">Preferences</h1>        
        </div>
        <div class="space-y-4">
          <ul class="space-y-4 flex flex-col" >
            <a href="">
              <li class="flex flex-row space-x-4 items-center bg-white rounded-md p-4 md:p-6 hover:bg-red-500 hover:text-white duration-300 ease-out">
                <Heroicons.icon name="cog-6-tooth" class="w-8 h-8" />
                <p class="text-[16px] md:text-[18px]">Admin Settings</p>
              </li>
            </a>
            <a href="">
              <li class="flex flex-row space-x-4 items-center bg-white rounded-md p-4 md:p-6 hover:bg-red-500 hover:text-white duration-300 ease-out">                <Heroicons.icon name="shield-check" class="w-8 h-8" />
                <p class="text-[16px] md:text-[18px]">Policy Tools</p>
              </li>
            </a>
           
          </ul>
        </div>
      </div>
      
    </aside>
    """
  end
end
