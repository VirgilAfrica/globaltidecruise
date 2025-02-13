defmodule GlobaltideWeb.LandingPageComponent do
  use Phoenix.Component
  use Phoenix.LiveComponent

  # mount
  def mount(_params, _session, socket) do
    {:ok, assign(socket, current_index: 0)}
  end

  def handle_event("next_page", _, socket) do
    max_index = length(role_data()) - 3
    new_index = min(socket.assigns.current_index + 3, max_index)

    {
      :noreply,
      assign(socket, current_index: new_index)
    }
  end

  def handle_event("prev_page", _, socket) do
    new_index = max(socket.assigns.current_index - 3, 0)
    {:noreply, assign(socket, current_index: new_index)}
  end

  def navbar(assigns) do
    assigns =
      assign(assigns, :nav_links, [
        %{name: "Home", path: "/"},
        %{name: "Jobs Available", path: "/jobs"},
        %{name: "Contact", path: "/contact"}
      ])

    ~H"""
    <nav class="w-full h-auto lg:shadow-sm border-b-2 border-blue-100 lg:border-none">
      <div class="hidden max-w-[90%] mx-auto lg:flex flex-row items-center justify-between">
        <div class="w-1/4 flex items-center">
          <img src="/images/globaltide-lg2.jpeg" alt="" class="w-20 h-20 rounded-full" />
        </div>
        <div class="w-full flex items-center justify-evenly space-x-4">
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
        <div class="w-1/4 items-end justify-between">
          <a href="/users/log_in">
            <button class="font-bold text-white rounded-xl transition-colors ease-linear hover:bg-red-700 bg-red-500 lg:px-8 py-4">
              Login
            </button>
          </a>
        </div>
      </div>

      <div class="flex lg:hidden w-full max-w-[90%] mx-auto justify-between items-center flex-row">
        <div class="">
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

  def hero_section(assigns) do
    ~H"""
    <section
      class="relative w-full h-auto md:h-auto py-10 md:py-20 lg:h-screen flex items-center justify-center lg:py-20 bg-gray-100 bg-center bg-cover"
      style=" background-image: url('/images/hero-cruise.jpeg')"
    >
      <div class="absolute inset-0 bg-gradient-to-r from-blue-500/90"></div>
      <div class="relative w-full max-w-[90%]  mx-auto h-full flex items-start justify-start">
        <div class="flex flex-col items-start justify-start w-full lg:w-1/2 space-y-4 lg:space-y-8 text-start text-white">
          <h1 class="text-[20px] md:text-[30px] lg:text-[34px] font-black leading-tight ">
            GREAT NEWS: WE NOW PROVIDE JOINING FLIGHT TICKETS FOR ALL NEW HIRES AND HOTEL REHIRES
          </h1>
          <p class="lg:text-[20px] leading-tight text-[16px] font-sans">
            Welcome to Global Tide Cruise LTD's official recruitment portal, where your journey to an exciting shipboard career begins. Discover a variety of job opportunities that match your skills and passions, and become part of our vibrant team.
          </p>
          <div class="flex flex-col lg:flex-row md:flex-row md:space-x-8 lg:space-x-8 space-y-4 lg:space-y-0 w-full ">
            <a href="">
              <button class="bg-red-500 text-white font-bold rounded-full uppercase shadow-md px-4 py-2 md:px-6 md:py-3  lg:px-8 lg:py-4 text-sm lg:text-lg">
                View All Jobs
              </button>
            </a>
            <a href="">
              <button class="bg-transparent border-white border-2 py-2 px-8 lg:px-8 lg:py-4 rounded-full text-white font-bold uppercase shadow-md ">
                Apply Today
              </button>
            </a>
          </div>
        </div>
      </div>
    </section>
    """
  end

  def departments(assigns) do
    ~H"""
    <section class="w-full h-auto py-10 md:py-20 bg-gray-100">
      <div class="max-w-[90%] mx-auto flex flex-col space-y-12">
        <div class="w-full flex flex-col items-start lg:items-center lg:justify-center">
          <h1 class="text-[24px] md:text-[30px] lg:text-[34px] uppercase text-blue-800 font-black ">
            explore our core departments
          </h1>
          <p class="text-[14px] lg:text-2xl md:text-xl font-medium uppercase">
            Discover Your Fit and Let Your Skills Set Sail
          </p>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2  lg:grid-cols-3 gap-4 lg:gap-8">
          <%= for department <- department_data() do %>
            <.department_card department={department} />
          <% end %>
        </div>
      </div>
    </section>
    """
  end

  defp department_data do
    [
      %{
        id: 1,
        img: "/images/DepImgs/guestandservices.jpeg",
        title: "Guest Services & Support",
        desc:
          "Enhancing the guest experience with personalized assistance, including room service, luggage handling, and concierge support.",
        btn: "View Position"
      },
      %{
        id: 2,
        img: "/images/DepImgs/food&beverages.jpeg",
        title: "Food & Beverage Team",
        desc:
          "Delivering top-quality dining experiences, from kitchen preparation to table service, in various onboard restaurants, bars, and buffets.",
        btn: "View Position"
      },
      %{
        id: 3,
        img: "/images/DepImgs/cleaning.jpeg",
        title: "Housekeeping & Maintenance",
        desc:
          "Ensuring the cleanliness and upkeep of guest rooms, public areas, and amenities, creating a comfortable and hygienic environment.",
        btn: "View Position"
      },
      %{
        id: 4,
        img: "/images/DepImgs/vacation.jpeg",
        title: "Recreation & Wellness",
        desc:
          "Offering spa treatments, fitness classes, and recreational activities to promote relaxation and well-being. Join GlobalTide",
        btn: "View Position"
      },
      %{
        id: 5,
        img: "/images/DepImgs/entertainment-activities.jpeg",
        title: "Entertainment & Activities",
        desc:
          "Engaging guests with performances, themed events, youth programs, and photography to create memorable experiences.",
        btn: "View Position"
      },
      %{
        id: 6,
        img: "/images/DepImgs/security&safety.jpeg",
        title: "Security & Safety",
        desc:
          "Maintaining a safe environment through trained security officers and lifeguards, ensuring guest safety at all times.",
        btn: "View Position"
      }
    ]
  end

  defp department_card(assigns) do
    ~H"""
    <div class="relative group border bg-white rounded-3xl border=gray-300 p-4 w-full text-center cursor-pointer space-y-4 items-center flex flex-col justify-center">
      <div class="flex flex-col items-center h-[60%]">
        <img
          src={@department.img}
          alt={@department.title}
          class="w-full  bg-cover bg-center rounded-lg h-[300px]"
        />
      </div>
      <div class="flex flex-col items-center justify-evenly my-4 space-y-2 h-[40%]">
        <h1 class="text-lg lg:text-md font-semibold">{@department.title}</h1>
        <p class="lg:text-lg text-[14px] leading-normal text-gray-500">{@department.desc}</p>
      </div>
      <div>
        <a href="/jobs_available">
          <button class="px-6 sm:px-6 lg:px-8 py-2 sm:py-3 lg:py-4 border-red-500 border-2 rounded-full text-lg lg:text-[20px] hover:bg-blue-500 hover:text-white hover:border-white transition-all ease-in">
            View Position
          </button>
        </a>
      </div>
    </div>
    """
  end

  def application_component(assigns) do
    ~H"""
    <section class="w-full h-auto py-10 md:py-20 bg-white">
      <div class="max-w-[90%] mx-auto flex flex-col">
        <div class="w-full flex flex-col items-center justify-center my-20 space-y-4 lg:space-y-8">
          <span class="px-8 py-4 lg:py-4 font-bold uppercase bg-gray-100 rounded-full text-sm">
            how to apply
          </span>
          <h1 class="uppercase font-bold text-[20px] md:text-[30px] lg:text-[34px] text-center leading-snu">
            Your Journey to a Rewarding Shipboard Career Starts Here
          </h1>
          <p class="text-lg md:text-xl lg:text-2xl font-medium text-center">
            Discover Your Fit and Let Your Skills Set Sail
          </p>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 lg:gap-8">
          <%= for application <- application_data()  do %>
            <.application_card application={application} />
          <% end %>
        </div>
      </div>
    </section>
    """
  end

  defp application_data do
    [
      %{
        id: 1,
        logoRef: "/images/applicationImgs/arcticons_medicover (1).png",
        title: "Discover the Steps to Join Our Dynamic Cruise Team",
        desc:
          "Follow our straightforward recruitment process to embark on your maritime adventure."
      },
      %{
        id: 2,
        logoRef: "/images/applicationImgs/iconoir_bed-ready (1).png",
        title: "Understand the Requirements for Your Desired Shipboard Position",
        desc: "Explore the qualifications needed to thrive in various shipboard roles."
      },
      %{
        id: 3,
        logoRef: "/images/applicationImgs/iconoir_bed-ready.png",
        title: "Get Ready for Your Interview with Our Expert Tips",
        desc:
          "Prepare effectively with our comprehensive interview guidance tailored for cruise jobs."
      }
    ]
  end

  defp application_card(assigns) do
    ~H"""
    <div class="flex flex-col items-center shadow-md space-y-8 md:p-4 p-8 lg:p-8">
      <div class="w-24 md:w-32 lg:w-40">
        <img src={@application.logoRef} alt={@application.title} class="w-full h-auto" />
      </div>
      <div class="flex flex-col items-center justify-evenly space-y-4 sm:space-y-8">
        <h1 class="text-md md:text-[20px] lg:text-[24px] text-center font-bold leading-tight">
          {@application.title}
        </h1>
        <p class="text-base md:text-lg lg:text-xl text-center text-gray-600">
          {@application.desc}
        </p>
      </div>
    </div>
    """
  end

  def roles(assigns) do
    assigns = assign_new(assigns, :current_index, fn -> 0 end)

    ~H"""
    <section class="w-full h-auto py-10 md:py-20 bg-blue-700">
      <div class="max-w-[90%] mx-auto flex flex-col">
        <div class="w-full flex flex-col items-center justify-center my-20 space-y-4 lg:space-y-8">
          <span class="px-8 py-4 lg:py-4 font-bold uppercase bg-red-500 text-white rounded-full text-sm">
            Explore
          </span>
          <h1 class="text-[20px] md:text-[30px] lg:text-[34px] text-center font-bold text-white mt-4">
            What Roles Are in Demand?
          </h1>
          <p class="text-[16px] md:text-2xl lg:text-3xl font-normal text-white mt-4 text-center">
            Join us on an exciting journey across the seas. Explore diverse
            career opportunities that match your skills and passions.
          </p>
        </div>
        <div>
          <div class="flex flex-row py-4 space-x-4 items-start justify-end">
            <button
              phx-click="prev_page"
              class="px-4 py-2 md:px-6 md:py-3 lg:px-8 lg:py-4 bg-gray-300 hover:bg-gray-100 rounded-xl"
              disabled={@current_index == 0 or is_nil(@current_index)}
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 24 24"
                fill="currentColor"
                class="size-6"
              >
                <path
                  fill-rule="evenodd"
                  d="M7.72 12.53a.75.75 0 0 1 0-1.06l7.5-7.5a.75.75 0 1 1 1.06 1.06L9.31 12l6.97 6.97a.75.75 0 1 1-1.06 1.06l-7.5-7.5Z"
                  clip-rule="evenodd"
                />
              </svg>
            </button>
            <button
              phx-click="next_page"
              class="px-4 py-2 md:px-6 md:py-3 lg:px-8 lg:py-4 bg-gray-300 hover:bg-gray-100 rounded-xl"
              disabled={@current_index + 3 >= length(role_data())}
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 24 24"
                fill="currentColor"
                class="size-6"
              >
                <path
                  fill-rule="evenodd"
                  d="M16.28 11.47a.75.75 0 0 1 0 1.06l-7.5 7.5a.75.75 0 0 1-1.06-1.06L14.69 12 7.72 5.03a.75.75 0 0 1 1.06-1.06l7.5 7.5Z"
                  clip-rule="evenodd"
                />
              </svg>
            </button>
          </div>
          <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 lg:gap-6">
            <%= for role <- Enum.slice(role_data(), @current_index, 3) do %>
              <.role_card role={role} />
            <% end %>
          </div>
          <div></div>
        </div>
      </div>
    </section>
    """
  end

  defp role_card(assigns) do
    ~H"""
    <div
      x-data="{ hover: false }"
      @mouseover="hover = true"
      @mouseleave="hover = false"
      class="relative h-[400px] md:h-auto flex flex-col items-center w-full bg-transparent rounded-t-xl shadow-lg transform transition-transform duration-300"
    >
      <div class="bg-cover bg-center w-full h-[250px]" style="background-image: url('{@role.imgRef}')">
      </div>

      <div class="h-[150px] md:h-[200px] lg:h-1/3 flex flex-row items-center justify-center w-full text-center p-2 bg-gradient-to-t from-black to-transparent">
        <a href="/jobs">
          <div>
            <h1 class="text-[20px] md:text-[24px] lg:text-[28px] font-bold text-white">
              {@role.title}
            </h1>
            <p class="mt-2 text-xl text-white md:text-[20px]">
              {@role.desc}
            </p>
          </div>

          <span x-show="hover" class="block mt-2 px-2 text-lg text-gray-300">
            <i class="fas fa-arrow-right"></i>
          </span>
        </a>
      </div>

      <div
        x-show="hover"
        x-transition
        class="absolute top-0 bg-black w-full h-[250px] md:h-[250px] p-4 md:p-6 bg-opacity-80 text-white rounded-lg shadow-md flex items-center justify-center flex-col z-10"
      >
        <p class="text-[18px] md:text-[20px] lg:text-[16px]">
          {@role.hoverDesc}
        </p>
      </div>
    </div>
    """
  end

  defp role_data do
    [
      %{
        id: 1,
        imgRef: "/images/DepImgs/security.png",
        title: "RSA Security Supervisor",
        desc: "Marine Operations-Security Service",
        hoverDesc:
          "Maintain a Safe Environment throught trained security officers and lifeguards, ensuring guest safety all the time"
      },
      %{
        id: 2,
        imgRef: "/images/DepImgs/vacation.jpeg",
        title: "RSA Security Supervisor",
        desc: "Marine Operations- Security Service",
        hoverDesc:
          "Maintain a Safe Environment throught trained security officers and lifeguards, ensuring guest safety all the time"
      },
      %{
        id: 3,
        imgRef: "/images/DepImgs/guestandservices.jpeg",
        title: "RSA Security Supervisor",
        desc: "Marine Operations- Security Service",
        hoverDesc:
          "Maintain a Safe Environment throught trained security officers and lifeguards, ensuring guest safety all the time"
      },
      %{
        id: 4,
        imgRef: "/images/DepImgs/cleaning.jpeg",
        title: "RSA Security Supervisor",
        desc: "Marine Operations- Security Service",
        hoverDesc:
          "Maintain a Safe Environment throught trained security officers and lifeguards, ensuring guest safety all the time"
      },
      %{
        id: 5,
        imgRef: "/images/DepImgs/food&beverages.jpeg",
        title: "RSA Security Supervisor",
        desc: "Marine Operations- Security Service",
        hoverDesc:
          "Maintain a Safe Environment throught trained security officers and lifeguards, ensuring guest safety all the time"
      },
      %{
        id: 6,
        imgRef: "/images/DepImgs/entertainment-activities.jpeg",
        title: "RSA Security Supervisor",
        desc: "Marine Operations- Security Service",
        hoverDesc:
          "Maintain a Safe Environment throught trained security officers and lifeguards, ensuring guest safety all the time"
      }
    ]
  end

  def testimony_component(assigns) do
    ~H"""
    <section class="w-full max-w-[90%] md:max-w-[80%] lg:max-w-[80%] py-10 lg:py-20 mx-auto flex flex-col justify-evenly h-[100%] items-center">
      <div class="flex flex-col max-w-[90%]">
        <div class="mb-4">
          <h1 class="text-[24px] lg:text-[34px] md:text-[30px] text-center font-bold">
            What our crew has to say.
          </h1>
        </div>
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-4">
          <%= for testimony <- testimony_data() do %>
            <.testimony_tile testimony={testimony} />
          <% end %>
        </div>
        <div class="flex justify-center mt-4 space-x-4 my-10">
          <button class="px-4 py-2 bg-gray-300 rounded-lg">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24"
              fill="currentColor"
              class="size-6"
            >
              <path
                fill-rule="evenodd"
                d="M7.72 12.53a.75.75 0 0 1 0-1.06l7.5-7.5a.75.75 0 1 1 1.06 1.06L9.31 12l6.97 6.97a.75.75 0 1 1-1.06 1.06l-7.5-7.5Z"
                clip-rule="evenodd"
              />
            </svg>
          </button>
          <button class="px-4 py-2 bg-gray-300 rounded-lg">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24"
              fill="currentColor"
              class="size-6"
            >
              <path
                fill-rule="evenodd"
                d="M16.28 11.47a.75.75 0 0 1 0 1.06l-7.5 7.5a.75.75 0 0 1-1.06-1.06L14.69 12 7.72 5.03a.75.75 0 0 1 1.06-1.06l7.5 7.5Z"
                clip-rule="evenodd"
              />
            </svg>
          </button>
        </div>
      </div>
    </section>
    """
  end

  defp testimony_tile(assigns) do
    ~H"""
    <div class="flex flex-col bg-white p-8 rounded-3xl w-auto shadow-md h-96">
      <span class="font-bold ">{@testimony.tag}</span>
      <div class="flex flex-col  space-y-4">
        <h1 class="text-[16px] md:text-[24px] lg:text-xl font-bold">
          {@testimony.title}
        </h1>
        <p class="text-md md:text-xl font-normal text-gray-500">"{@testimony.desc}"</p>
      </div>
      <div class="flex flex-row w-full h-1/2 items-center justify-center ">
        <div class="bg-purple-200 rounded-full w-auto h-1/2">
          <img
            src={@testimony.imgRef}
            alt={@testimony.title}
            class="rounded-full bg-cover w-[80px] h-[80px] bg-center "
          />
        </div>
        <div class="flex flex-col justify-evenly p-2 w-[60%]">
          <h2 class="font-bold text-md lg:text-lg">{@testimony.name}</h2>
          <span class="text-sm md:text-md">{@testimony.role}</span>
        </div>
      </div>
    </div>
    """
  end

  defp testimony_data do
    [
      %{
        id: 1,
        tag: "Deck officer",
        title: "Journeys that Inspire",
        desc:
          "Working on the cruise has been a life-changing experience. I've traveled the world while building lifelong friendships with my colleagues.",
        imgRef: "images/persona/Sophia.png",
        name: "Sophia Moore",
        role: "Deck Officer, Global Tide"
      },
      %{
        id: 2,
        tag: "Global tide",
        title: "Transformative Experiences",
        desc:
          "Being employed on the cruise has transformed my life. I've explored the globe and formed lasting bonds with my fellow workers.",
        imgRef: "images/persona/adam.png",
        name: "Adam Smith",
        role: "Navigation Officer, Global Tide"
      }
    ]
  end

  def team_component(assigns) do
    ~H"""
    <section
      class="relative w-full h-auto lg:h-[400px] bg-cover bg-fixed flex flex-col items-center justify-center"
      style="background-image: url(/images/cruise2.jpeg)"
    >
      <div class="absolute inset-0 bg-black/50"></div>
      <div class="relative w-full max-w-[90%] lg:max-w-[80%] mx-auto space-y-4 my-10 lg:space-y-8 text-center lg:text-start">
        <div class="relative">
          <h1 class="text-[24px] md:text-[30px] lg:text-[34px] font-bold text-white">
            Join Our Exciting Team Today
          </h1>
          <p class="text-lg md:text-xl lg:text-3xl text-white mt-4">
            Explore amazing career opportunities at sea and embark on a journey
            of a lifetime.
          </p>
        </div>
        <div className="flex flex-col lg:flex-row sm:space-y-4 lg:space-y-0  lg:space-x-4 justify-start relative">
          <button class="pointer py-2 px-4 lg:py-4 lg:px-8 text-sm md:text-xl bg-red-500 text-white rounded-lg w-auto">
            Apply
          </button>
          <button class="pointer py-2 px-4  lg:py-4 lg:px-8  text-sm md:text-xl border-2 border-gray-400 text-white rounded-lg">
            View All Jobs
          </button>
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
