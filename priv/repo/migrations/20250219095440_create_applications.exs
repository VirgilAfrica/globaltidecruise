defmodule Globaltide.Repo.Migrations.CreateApplications do
  use Ecto.Migration

  def change do
    create table(:applications) do
      add :job_name, :string
      add :cv, :text
      add :cover_letter, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:applications, [:user_id])
  end
end
