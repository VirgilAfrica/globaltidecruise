defmodule Globaltide.Repo.Migrations.RemoveTypeOfJobFromApplications do
  use Ecto.Migration

  def change do
    alter table(:applications) do
      remove :type_of_job
    end
  end
end
