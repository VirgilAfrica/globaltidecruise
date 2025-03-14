defmodule GlobaltideWeb.ApplicationLive.FormComponent do
  use GlobaltideWeb, :live_component

  alias Globaltide.Applications
  alias Globaltide.JobListing
  alias Globaltide.Repo

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage application records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="application-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:job_listing_id]} type="select" label="Select Job" options={Enum.map(@jobs, &{&1.job_title, &1.id})} />
        <.input field={@form[:cv_upload]} type="text" label="CV Upload" />

        <:actions>
          <.button type="submit" phx-disable-with="Saving...">Save Application</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{application: application} = assigns, socket) do
    IO.puts("Updating form component...")

    # Fetch jobs from the database
    jobs = Repo.all(JobListing)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:jobs, jobs)
     |> assign_new(:form, fn ->
       to_form(Applications.change_application(application))
     end)}
  end

  @impl true
  def handle_event("validate", %{"application" => application_params}, socket) do
    IO.inspect(application_params, label: "Validating input")

    changeset = Applications.change_application(socket.assigns.application, application_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"application" => application_params}, socket) do
    IO.inspect(application_params, label: "Received application_params")

    case Applications.create_application(application_params) do
      {:ok, application} ->
        IO.puts("Application created successfully!")
        notify_parent({:saved, application})

        {:noreply,
         socket
         |> put_flash(:info, "Application created successfully")
         |> push_patch(to: socket.assigns[:patch] || "/applications")}

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.puts("Failed to create application.")
        IO.inspect(changeset, label: "Changeset errors")

        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
