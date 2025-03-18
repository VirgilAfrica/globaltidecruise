defmodule GlobaltideWeb.ApplicationLive.Index do
  use GlobaltideWeb, :live_view

  alias Globaltide.Applications
  alias Globaltide.Applications.Application
  alias Globaltide.Accounts
  alias Globaltide.Repo

  @impl true
  def mount(_params, session, socket) do
    user = get_current_user(session)

    if connected?(socket), do: GlobaltideWeb.Endpoint.subscribe("applications")

    applications =
      Applications.list_applications()
      |> Repo.preload(:job_listing)

    {:ok,
     socket
     |> assign(:current_user, user)
     |> stream(:applications, applications)}
  end

  defp get_current_user(session) do
    case session["user_token"] do
      nil -> nil
      token -> Accounts.get_user_by_session_token(token)
    end
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    application = Applications.get_application!(id) |> Repo.preload(:job_listing)

    socket
    |> assign(:page_title, "Edit Application")
    |> assign(:application, application)
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Application")
    |> assign(:application, %Application{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Applications")
    |> assign(:application, nil)
  end

  @impl true
  def handle_info({GlobaltideWeb.ApplicationLive.FormComponent, {:saved, application}}, socket) do
    {:noreply, stream_insert(socket, :applications, application |> Repo.preload(:job_listing))}
  end

  def handle_info({:created, application}, socket) do
    {:noreply, stream_insert(socket, :applications, application |> Repo.preload(:job_listing))}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    application = Applications.get_application!(id)
    {:ok, _} = Applications.delete_application(application)

    {:noreply, stream_delete(socket, :applications, application)}
  end
end
