defmodule Globaltide.Applications do
  @moduledoc """
  The Applications context module for managing job applications.
  """

  import Ecto.Query, warn: false
  alias Globaltide.Repo
  alias Globaltide.Applications.Application

  # **List all applications**
  def list_applications do
    Repo.all(Application) |> Repo.preload(:job_listing)
  end

  # **List applications for a specific user**
  def list_user_applications(user_id) do
    from(a in Application, where: a.user_id == ^user_id, preload: [:job_listing])
    |> Repo.all()
  end

  # **Get a single application by ID**
  def get_application!(id) do
    Repo.get!(Application, id) |> Repo.preload([:job_listing])
  end

  # **Create a new application**
  def create_application(attrs \\ %{}) do
    %Application{}
    |> Application.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, application} ->
        send_update_to_liveview(application)  # Notify LiveView
        {:ok, application}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  # **Update an application**
  def update_application(%Application{} = application, attrs) do
    application
    |> Application.changeset(attrs)
    |> Repo.update()
    |> case do
      {:ok, updated_application} ->
        send_update_to_liveview(updated_application)  # Notify LiveView
        {:ok, updated_application}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  # **Delete an application**
  def delete_application(%Application{} = application) do
    Repo.delete(application)
    |> case do
      {:ok, deleted_application} ->
        send_update_to_liveview(deleted_application)  # Notify LiveView
        {:ok, deleted_application}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  # **Change function for forms**
  def change_application(%Application{} = application, attrs \\ %{}) do
    Application.changeset(application, attrs)
  end

  # **Approve an application**
  def approve_application(application_id) do
    case Repo.get(Application, application_id) do
      nil -> {:error, "Application not found"}
      application -> update_application_status(application, "approved")
    end
  end

  # **Reject an application**
  def reject_application(application_id) do
    case Repo.get(Application, application_id) do
      nil -> {:error, "Application not found"}
      application -> update_application_status(application, "rejected")
    end
  end

  # **Helper function to update status**
  defp update_application_status(%Application{} = application, status) do
    case Repo.update(Application.changeset(application, %{status: status})) do
      {:ok, updated_application} ->
        send_update_to_liveview(updated_application)  # Notify LiveView
        {:ok, updated_application}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  # **Notify LiveView instead of PubSub**
  defp send_update_to_liveview(application) do
    send(self(), {:application_updated, application})
  end
end
