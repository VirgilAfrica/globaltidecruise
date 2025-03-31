defmodule GlobaltideWeb.ApplicationLive.Index do
  use GlobaltideWeb, :live_view

  alias Globaltide.Applications
  alias Globaltide.Applications.Application
  alias Globaltide.Accounts
  alias Globaltide.Repo

  @impl true
  def mount(%{"job_id" => job_id}, session, socket) do
    user = get_current_user(session)

    if connected?(socket), do: GlobaltideWeb.Endpoint.subscribe("applications")

    applications = fetch_applications_for_user(user)

    {:ok,
     socket
     |> assign(:current_user, user)
     |> assign(:selected_job_id, job_id)
     |> stream(:applications, applications)}
  end

  def mount(_, session, socket) do
    user = get_current_user(session)

    if connected?(socket), do: GlobaltideWeb.Endpoint.subscribe("applications")

    applications = fetch_applications_for_user(user)

    {:ok,
     socket
     |> assign(:current_user, user)
     |> assign(:selected_job_id, nil)
     |> stream(:applications, applications)}
  end

  defp get_current_user(session) do
    case session["user_token"] do
      nil -> nil
      token -> Accounts.get_user_by_session_token(token)
    end
  end

  # No user logged in? No applications.
  defp fetch_applications_for_user(nil), do: []

  defp fetch_applications_for_user(%Globaltide.Accounts.User{role: "admin"}) do
    Applications.list_applications() |> Repo.preload(:job_listing)
  end

  defp fetch_applications_for_user(%Globaltide.Accounts.User{id: user_id}) do
    Applications.list_user_applications(user_id) |> Repo.preload(:job_listing)
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
