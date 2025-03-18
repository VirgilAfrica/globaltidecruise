defmodule Globaltide.Repo.Migrations.RecreateApplications do
  use Ecto.Migration

  def change do

    create table(:applications) do
      add :email, :string, null: false
      add :phone, :string, null: false
      add :cv_upload, :string, null: false
      add :status, :string, default: "pending", null: false

      add :job_listing_id, references(:job_listings, on_delete: :delete_all), null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:applications, [:job_listing_id])
    create index(:applications, [:user_id])
    create unique_index(:applications, [:user_id, :job_listing_id])
  end
end
