defmodule Globaltide.Repo.Migrations.CreateApplications do
  use Ecto.Migration

  def change do
    create table(:applications) do
      add :type_of_job, :string
      add :email, :string
      add :phone, :string
      add :cv_upload, :string

      timestamps(type: :utc_datetime)
    end
  end
end
