defmodule GlobaltideWeb.UserLoginLive do
  use GlobaltideWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-[50%]  shadow-md flex flex-col items-center justify-center h-screen">
    <div class="w-full item-center justify-center flex">
        <img src="/images/globaltide-lg2.jpeg" alt="" class="rounded-3xl lg:w-40 lg:h-40">
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

      <.simple_form for={@form} id="login_form" action={~p"/users/log_in"} phx-update="ignore">
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
            class="w-full bg-blue-300 hover:bg-blue-700 ease-in transition-colors duration-300"
          >
            Log in <span aria-hidden="true">→</span>
          </.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    email = Phoenix.Flash.get(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
