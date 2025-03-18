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
        <.input
          field={@form[:job_listing_id]}
          type="select"
          label="Select Job"
          options={Enum.map(@jobs, &{&1.job_title, &1.id})}
        />
        <.input field={@form[:email]} type="email" label="Email" />
        <.input field={@form[:phone]} type="text" label="Phone Number" />
        <div class="flex flex-col space-y-4">
          <label>Upload CV (PDF only)</label>
          <.live_file_input
            upload={@uploads.cv}
            class="px-4 py-2 lg:px-8 lg:py-4 hover:border-blue-500 duration-500 ease-in border-red-500 border-2 rounded-md"
          />
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

    IO.inspect(assigns.current_user)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:jobs, jobs)
     |> assign_new(:form, fn ->
       to_form(Applications.change_application(application))
     end)
     |> assign(:uploaded_files, [])
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
    uploaded_files =
      consume_uploaded_entries(socket, :cv, fn %{path: path}, _entry ->
        dest =
          Path.join(
            Application.app_dir(:globaltide, "priv/static/uploads"),
            Path.basename(path)
          )

        # You will need to create `priv/static/uploads` for `File.cp!/2` to work.
        File.cp!(path, dest)
        {:ok, ~p"/uploads/#{Path.basename(dest)}"}
      end)

    IO.inspect(uploaded_files)

    application_params =
      application_params
      |> Map.put("cv_upload", List.first(uploaded_files) || "")
      |> Map.put_new("email", "")
      |> Map.put_new("phone", "")
      |> Map.put("user_id", socket.assigns.current_user.id)

    case Applications.create_application(application_params) do
      {:ok, _application} ->
        {:noreply,
         socket
         |> put_flash(:info, "Application created successfully")
         |> push_navigate(to: "/")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
