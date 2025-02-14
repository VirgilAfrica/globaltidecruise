defmodule GlobaltideWeb.ContactLive.Index do
  use GlobaltideWeb, :live_view

  alias Globaltide.Contacts
  alias Globaltide.Contacts.Contact

  def mount(_params, _session, socket) do
    changeset = Contacts.change_contact(%Contact{})
    {:ok, assign(socket, changeset: changeset, is_open: false)}
  end

  def handle_event("submit", %{"contact" => contact_params}, socket) do
    case Contacts.create_contact(contact_params) do
      {:ok, _contact} ->
        {:noreply, put_flash(socket, :info, "Message sent successfully!")}

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def render(assigns) do
    ~H"""
    <.navbar is_open={@is_open} toggle_event="toggle-menu" />
    <.upper_section />
    <.contact_header />
    <.contact_form changeset={@changeset} />
    <.footer />
    """
  end
end
