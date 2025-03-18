defmodule Globaltide.Applications do
  @moduledoc """
  The Applications context module for managing job applications.
  """

  import Ecto.Query, warn: false
  alias Globaltide.Repo
  alias Globaltide.Applications.Application
  alias Phoenix.PubSub

  @topic "applications"

  # **Subscribe to real-time application updates**
  def subscribe do
    PubSub.subscribe(Globaltide.PubSub, @topic)
  end

  #  **List all applications**
  def list_applications do
    Repo.all(Application) |> Repo.preload(:job_listing)
  end

  #  **List applications for a specific user**
  def list_user_applications(user_id) do
    from(a in Application, where: a.user_id == ^user_id, preload: [:job_listing])
    |> Repo.all()
  end

  #  **Get a single application by ID**
  def get_application!(id) do
    Repo.get!(Application, id) |> Repo.preload([:job_listing])
  end

  #  **Create a new application**
  def create_application(attrs \\ %{}) do
    %Application{}
    |> Application.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, application} ->
        broadcast(:created, application)
        {:ok, application}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  #  **Update an application**
  def update_application(%Application{} = application, attrs) do
    application
    |> Application.changeset(attrs)
    |> Repo.update()
    |> case do
      {:ok, updated_application} ->
        broadcast(:updated, updated_application)
        {:ok, updated_application}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  #  **Delete an application**
  def delete_application(%Application{} = application) do
    Repo.delete(application)
    |> case do
      {:ok, deleted_application} ->
        broadcast(:deleted, deleted_application)
        {:ok, deleted_application}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  #  **Change function for forms**
  def change_application(%Application{} = application, attrs \\ %{}) do
    Application.changeset(application, attrs)
  end

  #  **Approve an application**
  def approve_application(application_id) do
    case Repo.get(Application, application_id) do
      nil -> {:error, "Application not found"}
      application -> update_application_status(application, "approved")
    end
  end

  #  **Reject an application**
  def reject_application(application_id) do
    case Repo.get(Application, application_id) do
      nil -> {:error, "Application not found"}
      application -> update_application_status(application, "rejected")
    end
  end

  #  **Helper function to update status**
  defp update_application_status(%Application{} = application, status) do
    case Repo.update(Application.changeset(application, %{status: status})) do
      {:ok, updated_application} ->
        send(self(), {:application_updated, updated_application})  # Notify LiveView process
        {:ok, updated_application}

      {:error, changeset} ->
        {:error, changeset}
    end
  end


  #  **Broadcast application changes**
  defp broadcast(event, application) do
    PubSub.broadcast(Globaltide.PubSub, @topic, {event, application})
  end
end
