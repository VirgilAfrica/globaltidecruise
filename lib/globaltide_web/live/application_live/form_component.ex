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
      >
        <.input field={@form[:type_of_job]} type="text" label="Type of job" />
        <.input field={@form[:email]} type="text" label="Email" />
        <.input field={@form[:phone]} type="text" label="Phone" />
        <.input field={@form[:cv_upload]} type="text" label="Cv upload" />
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
     end)}
  end

  @impl true
  def handle_event("validate", %{"application" => application_params}, socket) do
    changeset = Applications.change_application(socket.assigns.application, application_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"application" => application_params}, socket) do
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
end
