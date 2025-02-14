defmodule GlobaltideWeb.ContactComponent do
  use Phoenix.Component
  import Phoenix.HTML.Form

  def contact_form(assigns) do
    ~H"""
    <div class="max-w-full mx-auto lg:max-w-6xl">
      <.form for={@changeset} phx-submit="submit">
        <div class="flex flex-col space-y-4">
          <%= text_input @changeset, :name, required: true, placeholder: "Full Name", class: "border-2 border-gray-500 p-4 lg:p-8 w-full" %>
          <%= text_input @changeset, :email, required: true, placeholder: "Your Email", class: "border-2 border-gray-500 p-4 lg:p-8 w-full" %>
          <%= text_input @changeset, :phone, required: true, placeholder: "Your Phone Number", class: "border-2 border-gray-500 p-4 lg:p-8 w-full" %>
          <%= textarea @changeset, :message, required: true, placeholder: "Message", rows: "4", class: "border-2 border-gray-500 p-4 lg:p-8 w-full" %>
        </div>

        <div>
          <button type="submit" class="px-2 py-4 lg:px-4 lg:py-8 w-full text-md md:text-lg lg:text-xl bg-blue-400 text-white mt-4 hover:bg-blue-700 transition-colors ease-in">
            Send Message
          </button>
        </div>
      </.form>
    </div>
    """
  end
end
