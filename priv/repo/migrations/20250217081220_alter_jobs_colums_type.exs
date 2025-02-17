defmodule Globaltide.Repo.Migrations.AlterJobsColumsType do
  use Ecto.Migration

  def change do
    def up do
      alter table(:jobs) do
        modify :shortDesc, :text
        modify :longDesc, {:array, :text}
        modify :Roles, {:array, :text}
        modify :minRequirements, {:array, :text}
        modify :sideDesc, {:array, :text}
      end
    end

    def down do
      alter table(:jobs) do
        modify :shortDesc, :string
        modify :longDesc, :string
        modify :Roles, :string
        modify :minRequirements, :string
        modify :sideDesc, :string
      end
    end
  end
end
