defmodule GlobaltideWeb.UserRegistrationLive do
  use GlobaltideWeb, :live_view

  alias Globaltide.Accounts
  alias Globaltide.Accounts.User

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-[50%] p-4 hover:shadow-md transition-shadow duration-300">
      <div class="w-full item-center justify-center flex">
        <img src="/images/globaltide-lg2.jpeg" alt="" class="rounded-3xl lg:w-40 lg:h-40">
      </div>
      <.header class="text-center">
        Register for an account
        <:subtitle >
          Already registered?
          <.link navigate={~p"/users/log_in"} class="font-semibold text-blue-400 hover:underline">
            Log in
          </.link>
          to your account now.
        </:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="registration_form"
        phx-submit="save"
        phx-change="validate"
        phx-trigger-action={@trigger_submit}
        action={~p"/users/log_in?_action=registered"}
        method="post"
      >
        <.error :if={@check_errors}>
          Oops, something went wrong! Please check the errors below.
        </.error>

        <.input field={@form[:name]} type="text" label="Name" required />
        <.input field={@form[:email]} type="email" label="Email" required />
        <.input field={@form[:password]} type="password" label="Password" required />

        <!-- Role Selection Dropdown -->
        <.input field={@form[:role]} type="select" label="Role" options={["User", "Admin"]} required />

        <:actions>
          <.button phx-disable-with="Creating account..." class="w-full hover:bg-blue-500 transition-colors ease-in">
            Create an account
          </.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    changeset = Accounts.change_user_registration(%User{})

    socket =
      socket
      |> assign(trigger_submit: false, check_errors: false)
      |> assign_form(changeset)

    {:ok, socket, temporary_assigns: [form: nil]}
  end

  def handle_event("save", %{"user" => user_params}, socket) do
    case validate_admin_limit(user_params) do
      :ok ->
        case Accounts.register_user(user_params) do
          {:ok, user} ->
            {:ok, _} =
              Accounts.deliver_user_confirmation_instructions(
                user,
                &url(~p"/users/confirm/#{&1}")
              )

            changeset = Accounts.change_user_registration(user)
            {:noreply, socket |> assign(trigger_submit: true) |> assign_form(changeset)}

          {:error, %Ecto.Changeset{} = changeset} ->
            {:noreply, socket |> assign(check_errors: true) |> assign_form(changeset)}
        end

      {:error, message} ->
        changeset =
          Accounts.change_user_registration(%User{}, user_params)
          |> Ecto.Changeset.add_error(:role, message)

        {:noreply, assign_form(socket, Map.put(changeset, :action, :validate))}
    end
  end

  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset = Accounts.change_user_registration(%User{}, user_params)
    {:noreply, assign_form(socket, Map.put(changeset, :action, :validate))}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    form = to_form(changeset, as: "user")

    if changeset.valid? do
      assign(socket, form: form, check_errors: false)
    else
      assign(socket, form: form)
    end
  end

  # Function to check the number of admin users
  defp validate_admin_limit(%{"role" => "Admin"}) do
    admin_count = Accounts.count_admins()

    if admin_count < 2 do
      :ok
    else
      {:error, "Only two admins (Developer & Manager) are allowed."}
    end
  end

  defp validate_admin_limit(_params), do: :ok
end
