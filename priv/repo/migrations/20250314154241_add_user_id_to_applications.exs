defmodule Globaltide.Repo.Migrations.AddUserIdToApplications do
  use Ecto.Migration

  def change do
    alter table(:applications) do
      add :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
