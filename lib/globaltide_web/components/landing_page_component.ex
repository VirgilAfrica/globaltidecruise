defmodule GlobaltideWeb.LandingPageComponent do
  use Phoenix.Component

  def navbar(assigns) do
    assigns =
      assign(assigns, :nav_links, [
        %{name: "Home", path: "/"},
        %{name: "Jobs Available", path: "/job_available"},
        %{name: "Contact", path: "/contact"}
      ])

    ~H"""
    <nav class="w-full h-auto lg:shadow-sm border-b-2 border-blue-100 lg:border-none">
      <div class="hidden max-w-[90%] mx-auto lg:flex flex-row items-center justify-between">
        <div class="w-1/4 flex items-center">
          <img src="/images/logo.svg" alt="" class="w-20 h-20 rounded-full" />
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
          <img src="/images/logo.svg" alt="" class="w-20 h-20 rounded-full" />
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
          <h1 class="text-lg md:text-xl lg:text-2xl font-medium text-center">
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
    ~H"""
    <section class="w-full h-auto py-10 md:py-20 bg-white">
      <div class="max-w-[90%] mx-auto flex flex-col">
        <div class="w-full flex flex-col items-center justify-center my-20 space-y-4 lg:space-y-8">
          <span class="px-8 py-4 lg:py-4 font-bold uppercase bg-gray-100 rounded-full text-sm">
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
          <div>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              strokeWidth={1.5}
              stroke="currentColor"
              className="size-6"
            >
              <path strokeLinecap="round" strokeLinejoin="round" d="M15.75 19.5 8.25 12l7.5-7.5" />
            </svg>
          </div>
          <div></div>
          <div>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              class="size-6"
            >
              <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
            </svg>
          </div>
        </div>
      </div>
    </section>
    """
  end

  defp role_data do
    [
      %{
        id: 5,
        imgRef: "/images/DepImgs/food&beverages.jpeg",
        title: "RSA Security Supervisor",
        desc: "Marine Operations- Security Service",
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
        id: 6,
        imgRef: "/images/DepImgs/entertainment-activities.jpeg",
        title: "RSA Security Supervisor",
        desc: "Marine Operations- Security Service",
        hoverDesc:
          "Maintain a Safe Environment throught trained security officers and lifeguards, ensuring guest safety all the time"
      },
      %{
        id: 1,
        imgRef: "/images/DepImgs/security.png",
        title: "RSA Security Supervisor",
        desc: "Marine Operations-Security Service",
        hoverDesc:
          "Maintain a Safe Environment throught trained security officers and lifeguards, ensuring guest safety all the time"
      }
    ]
  end

  defp testimony_data do
    [
      %{
        id: 1,
        tag: "Deck officer",
        title: "Journeys that Inspire",
        desc:
          "Working on the cruise has been a life-changing experience. I've traveled the world while building lifelong friendships with my colleagues.",
        imgRef: "/persona/Sophia.png",
        name: "Sophia Moore",
        role: "Deck Officer, Global Tide"
      },
      %{
        id: 2,
        tag: "Global tide",
        title: "Transformative Experiences",
        desc:
          "Being employed on the cruise has transformed my life. I've explored the globe and formed lasting bonds with my fellow workers.",
        imgRef: "/persona/adam.png",
        name: "Adam Smith",
        role: "Navigation Officer, Global Tide"
      },
      %{
        id: 3,
        tag: "Global Tide",
        title: "A Career with a View",
        desc:
          "Every day is an adventure onboard. I get to wake up to breathtaking views and create unforgettable experiences for our passengers.",
        imgRef: "/persona/img4.jpg",
        name: "Emily Johnson",
        role: "Hospitality Manager, Global Tide"
      },
      %{
        id: 4,
        tag: "Global Tide",
        title: "Charting New Waters",
        desc:
          "This job has allowed me to grow professionally while exploring new horizons. I am proud to be part of a dynamic and supportive team.",
        imgRef: "/persona/img3.jpg",
        name: "James Carter",
        role: "Chief Engineer, Global Tide"
      }
    ]
  end
end
