defmodule Globaltide.Repo.Migrations.CreateJobListings do
  use Ecto.Migration

  def change do
    create table(:job_listings) do
      add :img_ref, :string
      add :job_tag, :string
      add :job_title, :string
      add :short_desc, :text
      add :long_desc, {:array, :text}
      add :btn, :string
      add :heading, {:array, :string}
      add :roles, {:array, :text}
      add :min_requirements, {:array, :text}
      add :req, :string
      add :side_head, {:array, :string}
      add :side_desc, {:array, :text}
      add :side_logo, {:array, :string}

      timestamps(type: :utc_datetime)
    end
  end
end
