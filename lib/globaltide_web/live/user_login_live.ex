defmodule GlobaltideWeb.UserLoginLive do
  use GlobaltideWeb, :live_view
  alias Heroicons
  alias Argon2

  @impl true
  def render(assigns) do
    ~H"""
    <section class="w-full bg-linear-to-r/srgb from-indigo-500 to-teal-400">
      <div class="mx-auto max-w-[90%] lg:max-w-[60%] shadow-md flex flex-col items-center justify-center h-screen">
          <div class="w-full item-center justify-center flex">
            <img src="/images/globaltide-lg2.jpeg" alt="" class="rounded-3xl w-20 h-20 lg:w-40 lg:h-40">
          </div>
          <.header class="text-center">
            Log in to account
            <:subtitle>
              Don't have an account?
              <.link navigate={~p"/users/register"} class="font-semibold text-red-500 hover:underline">
                Sign up
              </.link>
              for an account now.
            </:subtitle>
          </.header>

          <.simple_form for={@form} id="login_form" phx-submit="login">
            <.input field={@form[:email]} type="email" label="Email" required />
            <.input field={@form[:password]} type="password" label="Password" required />

            <:actions>
              <.input field={@form[:remember_me]} type="checkbox" label="Keep me logged in" />
              <.link
                href={~p"/users/reset_password"}
                class="text-sm font-semibold hover:text-red-500 hover:underline hover:offset-underline-4"
              >
                Forgot your password?
              </.link>
            </:actions>
            <:actions>
              <.button
                phx-disable-with="Logging in..."
                class="w-full flex items-center justify-center space-x-4 bg-blue-300 hover:bg-blue-700 ease-in transition-colors duration-300"
              >
                Log in <span aria-hidden="true">
                  <Heroicons.icon name="arrow-long-right" class="w-4 h-4"/>
                </span>
              </.button>
            </:actions>
          </.simple_form>
        </div>
    </section>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    email = Phoenix.Flash.get(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end

  @impl true
  def handle_event("login", %{"user" => %{"email" => email, "password" => password}}, socket) do
    case authenticate_user(email, password) do
      {:ok, user} ->
        path = case user.role do
          "Admin" -> "/admin"
          _ -> "/dashboard"
        end

        {:noreply, socket |> put_flash(:info, "Login successful") |> push_navigate(to: path)}

      :error ->
        {:noreply, socket |> put_flash(:error, "Invalid credentials")}
    end
  end

  defp authenticate_user(email, password) do
    # Replace this with your actual authentication logic
    case Globaltide.Accounts.get_user_by_email(email) do
      nil -> :error
      %Globaltide.Accounts.User{} = user ->
        if Argon2.verify_pass(password, user.hashed_password) do
          {:ok, user}
        else
          :error
        end
    end
  end
end
