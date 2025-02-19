defmodule Globaltide.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :req, :string
      add :imgRef, :string
      add :jobTag, :string
      add :jobTitle, :string
      add :shortDesc, :string
      add :longDesc, {:array, :string}
      add :btn, :string
      add :heading, {:array, :string}
      add :Roles, {:array, :string}
      add :minRequirements, {:array, :string}
      add :sideHead, {:array, :string}
      add :sideDesc, {:array, :string}
      add :sideLogo, {:array, :string}

      timestamps(type: :utc_datetime)
    end
  end
end
