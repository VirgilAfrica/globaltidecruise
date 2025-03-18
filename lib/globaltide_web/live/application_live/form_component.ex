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
        <.input field={@form[:email]} type="email" label="Email" />
        <.input field={@form[:phone]} type="text" label="Phone Number" />
        <div class="flex flex-col space-y-4">
        <label>Upload CV (PDF only)</label>
        <.live_file_input upload={@uploads.cv} class="px-4 py-2 lg:px-8 lg:py-4 hover:border-blue-500 duration-500 ease-in border-red-500 border-2 rounded-md" />
        </div>

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
     end)
     |> allow_upload(:cv, accept: ~w(.pdf), max_entries: 1)}
  end

  @impl true
  def handle_event("validate", %{"application" => application_params}, socket) do
    IO.inspect(application_params, label: "Validating input")

    changeset = Applications.change_application(socket.assigns.application, application_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  @impl true
  def handle_event("save", %{"application" => application_params}, socket) do
    IO.inspect(application_params, label: "Received application_params")


    # Process file upload
    uploaded_files =
      consume_uploaded_entries(socket, :cv, fn %{path: path}, _entry ->
        dest = Path.join(["priv/static/uploads", Path.basename(path)])
        File.cp!(path, dest)
        {:ok, "/uploads/" <> Path.basename(dest)}
      end)
      IO.inspect(uploaded_files, label: "Uploaded files")

    # Ensure we only store the first uploaded file
    application_params =
      application_params
      |> Map.put("cv_upload", List.first(uploaded_files) || "" )
      |> Map.put_new("email", "")
      |> Map.put_new("phone", "")
      |> Map.put("user_id", socket.assigns.current_user.id)



    changeset = Applications.change_application(%Applications.Application{}, application_params)

    # IO.inspect(changeset)



    if changeset.valid? do
      case Applications.create_application(application_params) do
        {:ok, application} ->
          IO.puts("Application created successfully!")
          notify_parent({:saved, application})
          IO.inspect(Applications)


          {:noreply,
           socket
           |> put_flash(:info, "Application created successfully")
           |> push_patch(to: socket.assigns[:patch] || "/applications")}

        {:error, %Ecto.Changeset{} = changeset} ->
          IO.puts("Failed to create application.")
          IO.inspect(changeset, label: "Changeset errors")

          {:noreply, assign(socket, form: to_form(changeset))}
      end
    else
      IO.puts("Validation failed: Missing required fields")
      {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
