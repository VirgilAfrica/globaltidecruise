defmodule Globaltide.Repo.Migrations.AddJobListingToApplications do
  use Ecto.Migration

  def change do
    alter table(:applications)do
      add :job_listing_id, references(:job_listings, on_delete: :delete_all)
    end
  end
end
