defmodule Globaltide.Applications do
  @moduledoc """
  The Applications context module for managing job applications.
  """

  import Ecto.Query, warn: false
  alias Globaltide.Repo
  alias Globaltide.Applications.Application

  # **List applications based on user role**
  def list_applications_for_user(%{role: "admin"}), do: list_applications()
  def list_applications_for_user(%{id: user_id}), do: list_user_applications(user_id)
  def list_applications_for_user(_), do: [] # If no valid user, return empty list.

  # **List all applications (Admin)**
  def list_applications do
    Repo.all(Application) |> Repo.preload(:job_listing)
  end

  # **List applications for a specific user**
  def list_user_applications(user_id) do
    Repo.all(from a in Application, where: a.user_id == ^user_id, preload: [:job_listing])
  end

  # **Get a single application by ID**
  def get_application!(id) do
    Repo.get!(Application, id) |> Repo.preload(:job_listing)
  end

  # **Create a new application**
  def create_application(attrs \\ %{}) do
    %Application{}
    |> Application.changeset(attrs)
    |> Repo.insert()
    |> handle_db_response()
  end

  # **Update an application**
  def update_application(%Application{} = application, attrs) do
    application
    |> Application.changeset(attrs)
    |> Repo.update()
    |> handle_db_response()
  end

  # **Delete an application**
  def delete_application(%Application{} = application) do
    Repo.delete(application)
    |> handle_db_response()
  end

  # **Approve an application**
  def approve_application(application_id) do
    update_application_status(application_id, "approved")
  end

  # **Reject an application**
  def reject_application(application_id) do
    update_application_status(application_id, "rejected")
  end

  # **Helper function to update application status**
  defp update_application_status(application_id, status) do
    case Repo.get(Application, application_id) do
      nil -> {:error, "Application not found"}
      application ->
        application
        |> Application.changeset(%{status: status})
        |> Repo.update()
        |> handle_db_response()
    end
  end

  # **Handle DB insert/update/delete responses**
  defp handle_db_response({:ok, application}) do
    send_update_to_liveview(application)
    {:ok, application}
  end

  defp handle_db_response({:error, changeset}), do: {:error, changeset}

  # **Notify LiveView about application updates**
  defp send_update_to_liveview(application) do
    GlobaltideWeb.Endpoint.broadcast("applications", "application_updated", %{application: application})
  end

  # **Return a changeset for an application**
def change_application(%Application{} = application, attrs \\ %{}) do
  Application.changeset(application, attrs)
end

end
