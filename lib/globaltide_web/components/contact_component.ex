defmodule GlobaltideWeb.ContactComponent do
  use Phoenix.Component

  def navbar(assigns) do
    assigns =
      assign(assigns, :nav_links, [
        %{name: "Home", path: "/"},
        %{name: "Jobs Available", path: "/jobs"},
        %{name: "Contact", path: "/contact"}
      ])

    ~H"""
    <nav class="w-full h-auto lg:shadow-sm border-b-2 border-blue-100 lg:border-none">
      <div class="hidden max-w-[90%] mx-auto lg:flex flex-row items-center justify-evenly">
        <div class="w-full flex items-center">
          <img src="/images/globaltide-lg2.jpeg" alt="" class="w-20 h-20 rounded-full" />
        </div>
        <div class="w-full flex items-center justify-center">
          <ul class="w-full flex flex-row items-center justify-evenly">
            <%= for link <- @nav_links do %>
              <a href={link.path}>
                <li class="text-[20px] font-medium">
                  {link.name}
                </li>
              </a>
            <% end %>
          </ul>
        </div>
        <div class="grid justify-items-end w-full">
          <a href="/users/log_in">
            <button class="font-bold text-white rounded-xl transition-colors ease-linear hover:bg-red-700 bg-red-500 lg:px-8 py-4">
              Login
            </button>
          </a>
        </div>
      </div>

      <div class="flex lg:hidden w-full max-w-[90%] mx-auto justify-between items-center flex-row">
        <div class="w-full h-auto max-w-[90%] mx-auto">
          <img src="/images/globaltide-lg2.jpeg" alt="" class="w-20 h-20 rounded-full" />
        </div>
        <div class="">
          <button phx-click="toggle-menu" class="z-20 lg-hidden p-2 border rounded-lg">
            <%= if @is_open do %>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-6"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="m9.75 9.75 4.5 4.5m0-4.5-4.5 4.5M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"
                />
              </svg>
            <% else %>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-6"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"
                />
              </svg>
            <% end %>
          </button>
        </div>
      </div>
      <button phx-click="toggle-menu" class="z-20 hidden lg:hidden p-2 border rounded-lg">
        <%= if @is_open do %>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
            class="size-6"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="m9.75 9.75 4.5 4.5m0-4.5-4.5 4.5M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"
            />
          </svg>
        <% else %>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
            class="size-6"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"
            />
          </svg>
        <% end %>
      </button>
      <div class={"absolute bg-white shadow-md top-25 lg:hidden w-full p-4 transition-all duration-300 " <> if(@is_open, do: "block", else: "hidden")}>
        <ul class="flex flex-col items-start justify-evenly  space-y-4 text-center">
          <%= for link <- @nav_links do %>
            <a href={link.path}>
              <li class="text-[20px] font-medium">
                {link.name}
              </li>
            </a>
          <% end %>
        </ul>
        <div class="flex flex-col space-y-4 mt-4 w-full">
          <a href="/users/log_in">
            <button class="font-bold text-white rounded-xl transition-colors ease-linear hover:bg-red-700 bg-red-500 px-8 py-4">
              Login
            </button>
          </a>
        </div>
      </div>
    </nav>
    """
  end

  def upper_section(assigns) do
    ~H"""
    <section class="h-auto  w-full">
      <div
        class=" relative lg:bg-fixed lg:bg-cover bg-fixed bg-contain w-full h-[20vh] lg:h-[80vh] flex items-center justify-center"
        style="background-image: url(/images/contact.jpg);"
      >
        <div class="absolute bg-black/50 inset-0 "></div>
        <div class="relative flex items-center justify-center ">
          <h1 class="text-center text-[24px] md:text-[30px] lg:text-[44px]  font-bold text-white">
            Contact Us Today!
          </h1>
        </div>
      </div>
    </section>
    """
  end

  def contact_header(assigns) do
    ~H"""
    <section class="w-full my-10 lg:my-20 max-w-[80%] mx-auto">
      <div class="w-full items-center justify-center flex flex-col  my-10 max-w-[100%] lg:max-w-6xl mx-auto">
        <span class="text-[16px] md:text-[20px] lg:text-[24px] font-black">
          Contact Us
        </span>
        <h1 class="text-[24px] md:text-[30px] lg:text-[48px] font-black">
          Let's Start a Conversation
        </h1>
        <p class="text-[16px] md:text-[20px] lg:text-[24px] text-center">
          Every great connection begins with a conversation. Don’t hesitate to
          reach out—we’re here to listen, share, and make great things happen
        </p>
      </div>
      <div class="bg-blue-700 text-white h-1/2 w-full max-w-[100%] mx-auto lg:max-w-6xl p-16 flex flex-col justify-evenly lg:flex-row lg:space-x-4 space-y-4 space-x-0 lg:space-y-0">
        <div class="flex flex-col items-start w-full space-y-4 ">
          <p class="text-[16px] md:text-[20px] lg:text-[20px] text-gray-300 font-thin">
            Working Hours
          </p>
          <span class="w-full border-b-2 border-grey-300 text-center"></span>
          <h2 class="text-[20px] md:text-[28px] lg:text-[32px]">
            Monday To Friday
          </h2>
          <h3 class="text-[18px] md:text-[26px] lg:text-[30px]">
            9.00 AM to 8.00PM
          </h3>
          <p class="text-[16px] md:text-[20px] lg:text-[20px] text-gray-300">
            Our support team is Available 24/7
          </p>
        </div>
        <div class="flex flex-col items-start w-full space-y-4">
          <p class="text-[16px] md:text-[20px] lg:text-[20px] text-gray-300 font-thin">
            Contact Us{" "}
          </p>
          <span class="w-full border-b-2 border-grey-300 text-center"></span>
          <h2 class="text-[20px] md:text-[28px] lg:text-[32px]">
            020 7993 2905{" "}
          </h2>

          <p class="text-[16px] md:text-[20px] lg:text-[20px] text-gray-300">
            hello@finsweet.com{" "}
          </p>
        </div>
      </div>
    </section>
    """
  end


  def footer(assigns) do
    ~H"""
    <footer class="-full bg-blue-800 lg:h-80  flex items-center justify-center text-white py-10 lg:py-20">
      <div class="w-full max-w-[90%] mx-auto">
        <div class="flex flex-col lg:space-x-4 lg:flex-row items-start justify-start lg:justify-center lg:items-center">
          <div class="w-full flex items-center">
            <img src="/images/globaltide-lg2.jpeg" alt="" class="w-20 h-20 " />
          </div>
          <div class="w-full flex flex-col lg:flex-row lg:space-x-8 space-y-2 lg:space-y-8">
            <ul class="font-bold flex flex-col lg:flex-row lg:items-center lg:justify-center lg:space-x-8 space-y-2 lg:space-y-0 ">
              <a href="" class="text-lg font-medium hover:text-gray-300 transition duration-200">
                <li>Home</li>
              </a>
              <a href="" class="text-lg font-medium hover:text-gray-300 transition duration-200">
                <li>Jobs available</li>
              </a>
              <a href="" class="text-lg font-medium hover:text-gray-300 transition duration-200">
                <li>Contact</li>
              </a>
            </ul>
          </div>
          <div class="w-full items-center justify-between lg:justify-center flex flex-col lg:flex-row">
            <div class="w-full flex items-center justify-center  space-y-4 lg:space-y-0">
              <ul class="w-full flex flex-row lg:space-x-8 items-center justify-center space-x-4">
                <a href="">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    x="0px"
                    y="0px"
                    width="20"
                    height="20"
                    viewBox="0 0 48 48"
                  >
                    <path fill="#039be5" d="M24 5A19 19 0 1 0 24 43A19 19 0 1 0 24 5Z"></path>
                    <path
                      fill="#fff"
                      d="M26.572,29.036h4.917l0.772-4.995h-5.69v-2.73c0-2.075,0.678-3.915,2.619-3.915h3.119v-4.359c-0.548-0.074-1.707-0.236-3.897-0.236c-4.573,0-7.254,2.415-7.254,7.917v3.323h-4.701v4.995h4.701v13.729C22.089,42.905,23.032,43,24,43c0.875,0,1.729-0.08,2.572-0.194V29.036z"
                    >
                    </path>
                  </svg>
                </a>

                <a href="">
                  <li class=" bg-blue-300 text-white rounded-xl">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      x="0px"
                      y="0px"
                      width="20"
                      height="20"
                      viewBox="0 0 50 50"
                    >
                      <path d="M 16 3 C 8.8545455 3 3 8.8545455 3 16 L 3 34 C 3 41.145455 8.8545455 47 16 47 L 34 47 C 41.145455 47 47 41.145455 47 34 L 47 16 C 47 8.8545455 41.145455 3 34 3 L 16 3 z M 16 5 L 34 5 C 40.054545 5 45 9.9454545 45 16 L 45 34 C 45 40.054545 40.054545 45 34 45 L 16 45 C 9.9454545 45 5 40.054545 5 34 L 5 16 C 5 9.9454545 9.9454545 5 16 5 z M 37 11 C 35.9 11 35 11.9 35 13 C 35 14.1 35.9 15 37 15 C 38.1 15 39 14.1 39 13 C 39 11.9 38.1 11 37 11 z M 25 14 C 18.954545 14 14 18.954545 14 25 C 14 31.045455 18.954545 36 25 36 C 31.045455 36 36 31.045455 36 25 C 36 18.954545 31.045455 14 25 14 z M 25 16 C 29.954545 16 34 20.045455 34 25 C 34 29.954545 29.954545 34 25 34 C 20.045455 34 16 29.954545 16 25 C 16 20.045455 20.045455 16 25 16 z">
                      </path>
                    </svg>
                  </li>
                </a>
                <a href="">
                  <li>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      x="0px"
                      y="0px"
                      width="20"
                      height="20"
                      viewBox="0 0 48 48"
                    >
                      <path
                        fill="#0288D1"
                        d="M42,37c0,2.762-2.238,5-5,5H11c-2.761,0-5-2.238-5-5V11c0-2.762,2.239-5,5-5h26c2.762,0,5,2.238,5,5V37z"
                      >
                      </path>
                      <path
                        fill="#FFF"
                        d="M12 19H17V36H12zM14.485 17h-.028C12.965 17 12 15.888 12 14.499 12 13.08 12.995 12 14.514 12c1.521 0 2.458 1.08 2.486 2.499C17 15.887 16.035 17 14.485 17zM36 36h-5v-9.099c0-2.198-1.225-3.698-3.192-3.698-1.501 0-2.313 1.012-2.707 1.99C24.957 25.543 25 26.511 25 27v9h-5V19h5v2.616C25.721 20.5 26.85 19 29.738 19c3.578 0 6.261 2.25 6.261 7.274L36 36 36 36z"
                      >
                      </path>
                    </svg>
                  </li>
                </a>
              </ul>
            </div>
            <div class="text-center w-full items-center   flex flex-col lg:flex-row ">
              <span class="flex flex-row text-lg font-bold">
                <.current_year /> &copy;
                <h3>GTCruise LTD</h3>
              </span>
            </div>
          </div>
        </div>
      </div>
    </footer>
    """
  end

  defp current_year(assigns) do
    ~H"""
    {Date.utc_today().year()}
    """
  end
end
