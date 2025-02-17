defmodule Globaltide.Repo.Migrations.CreateJobsTable do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      modify :shortDesc, :text
      modify :longDesc, :text
      modify :Roles, :text
      modify :minRequirements, :text
      modify :sideDesc, :text
    end
  end
end
