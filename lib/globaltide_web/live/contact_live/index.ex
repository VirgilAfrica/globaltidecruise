defmodule GlobaltideWeb.ContactLive.Index do
  use GlobaltideWeb, :live_view
  on_mount {GlobaltideWeb.UserAuth, :mount_current_user}
  import GlobaltideWeb.Common.NavbarComponent
  import GlobaltideWeb.ContactComponent
  alias GlobaltideWeb.ContactLive.FormComponent
  alias GlobaltideWeb.UserAuth

  def mount(_params, _session, socket) do
    {:ok, assign(socket, is_open: false, current_index: 0)}
  end


  def handle_event("toggle-menu", _params, socket) do
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  def render(assigns) do
    ~H"""
    <.navbar is_open={@is_open} toggle_event="toggle-menu" current_user={nil} />
    <.upper_section />
    <.contact_header />
    <.live_component module={FormComponent} id="contact-form" />
    <.footer />
    """
  end

end
