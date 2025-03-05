defmodule GlobaltideWeb.ContactLive.FormComponent do
  use GlobaltideWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div class="w-full">
      <div class="w-full max-w-[90%] my-4 lg:my-10 mx-auto flex flex-col items-center justify-center">
        <.simple_form
          for={@form}
          id="contact-form"
          phx-target={@myself}
          phx-change="validate"
          phx-submit="save"
          class="w-full max-w-6xl"
        >
          <input
            type="text"
            placeholder="Name"
            name="name"
            value={@form["name"]}
            class="border-2 border-blue-500 p-4 lg:p-8 w-full"
          />
          <%= if @errors["name"] do %>
            <p class="text-red-500">{@errors["name"]}</p>
          <% end %>

          <input
            field={@form["email"]}
            type="email"
            placeholder="Email"
            name="email"
            value={@form["email"]}
            class="border-2 border-blue-500 p-4 lg:p-8 w-full"
          />
          <%= if @errors["email"] do %>
            <p class="text-red-500">{@errors["email"]}</p>
          <% end %>

          <input
            field={@form["phone"]}
            type="tel"
            placeholder="Phone"
            name="phone"
            value={@form["phone"]}
            class="border-2 border-blue-500 p-4 lg:p-8 w-full"
          />
          <%= if @errors["phone"] do %>
            <p class="text-red-500">{@errors["phone"]}</p>
          <% end %>

          <input
            field={@form["message"]}
            type="textarea"
            placeholder="Message"
            name="message"
            rows={8}
            value={@form["message"]}
            class="border-2 border-blue-500 p-4 lg:p-8 w-full"
          />
          <%= if @errors["message"] do %>
            <p class="text-red-500">{@errors["message"]}</p>
          <% end %>

          <:actions>
            <button
              class="p-8 font-bold w-full text-md md:text-lg lg:text-md  text-white mt-4 bg-blue-500 transition-colors ease-in"
              phx-disable-with="Submitting...."
            >
              Send Message
            </button>
          </:actions>
        </.simple_form>
      </div>
    </div>
    """
  end

  @impl true
  def mount(socket) do
    form = %{"name" => "", "email" => "", "phone" => "", "message" => ""}
    {:ok, assign(socket, form: form, errors: %{})}
  end

  @impl true
  def handle_event("validate", params, socket) do
    errors = %{}

    errors =
      if params["name"] == "", do: Map.put(errors, "name", "Name can't be blank"), else: errors

    errors =
      if params["email"] == "", do: Map.put(errors, "email", "Email can't be blank"), else: errors

    errors =
      if params["phone"] == "", do: Map.put(errors, "phone", "Phone can't be blank"), else: errors

    errors =
      if params["message"] == "",
        do: Map.put(errors, "message", "Message can't be blank"),
        else: errors

    {:noreply, assign(socket, form: params, errors: errors)}
  end

  @impl true
  def handle_event(
        "save",
        %{"name" => name, "email" => email, "phone" => phone, "message" => message},
        socket
      ) do
    errors = %{}

    errors =
      if name == "",
        do: Map.put(errors, "name", "Name can't be blank.Come on you are getting a job"),
        else: errors

    errors = if email == "", do: Map.put(errors, "email", "Email can't be blank"), else: errors
    errors = if phone == "", do: Map.put(errors, "phone", "Phone can't be blank"), else: errors

    errors =
      if message == "", do: Map.put(errors, "message", "Message can't be blank"), else: errors

    if map_size(errors) > 0 do
      {:noreply, assign(socket, errors: errors)}
    else
      IO.puts("Form submitted: #{name}, #{email}, #{phone}, #{message}")

      {:noreply,
       socket
       |> put_flash(:info, "Your message has been submitted successfully!")
       |> assign(:form, %{"name" => "", "email" => "", "phone" => "", "message" => ""})
       |> assign(:errors, %{})}
    end
  end
end
