defmodule GlobaltideWeb.ApplicationLive.FormComponent do
  use GlobaltideWeb, :live_component

  alias Globaltide.Applications

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
        phx-drop-target={@uploads.cv.ref}
      >
        <.input field={@form[:job_name]} type="text" label="Job Name" />

        <!-- PDF Upload Field -->
        <label class="block text-gray-700 font-bold mb-2">Upload CV (PDF only)</label>
        <.live_file_input upload={@uploads.cv} class="border p-2" />

        <!-- Show uploaded file -->
        <%= for entry <- @uploads.cv.entries do %>
          <div class="mt-2 text-sm">
            <%= entry.client_name %> (Uploading...)
            <button type="button" phx-click="cancel-upload" phx-value-ref={entry.ref} class="text-red-500 ml-2">Cancel</button>
          </div>
        <% end %>

        <.input field={@form[:cover_letter]} type="text" label="Cover Letter" />

        <:actions>
          <.button phx-disable-with="Saving...">Save Application</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{application: application} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Applications.change_application(application))
     end)
     |> allow_upload(:cv, accept: ~w(.pdf), max_entries: 1)}
  end

  @impl true
  def handle_event("validate", %{"application" => application_params}, socket) do
    changeset = Applications.change_application(socket.assigns.application, application_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  @impl true
def handle_event("save", %{"application" => application_params}, socket) do
  uploaded_files =
    consume_uploaded_entries(socket, :cv, fn %{path: path}, entry ->
      dest = Path.join([:code.priv_dir(:globaltide), "static", "uploads", entry.client_name])
      File.cp!(path, dest)
      {:ok, "/uploads/#{entry.client_name}"}
    end)

  # Update application_params with uploaded file path
  application_params =
    if uploaded_files != [] do
      Map.put(application_params, "cv", List.first(uploaded_files))
    else
      application_params
    end

  save_application(socket, socket.assigns.action, application_params)
end

  defp save_application(socket, :edit, application_params) do
    case Applications.update_application(socket.assigns.application, application_params) do
      {:ok, application} ->
        notify_parent({:saved, application})

        {:noreply,
         socket
         |> put_flash(:info, "Application updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_application(socket, :new, application_params) do
    case Applications.create_application(application_params) do
      {:ok, application} ->
        notify_parent({:saved, application})

        {:noreply,
         socket
         |> put_flash(:info, "Application created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})

  # @impl true
  # def handle_event("cancel-upload", %{"ref" => ref}, socket) do
  #   {:noreply, cancel_upload(socket, :cv, ref)}
  # end
end
