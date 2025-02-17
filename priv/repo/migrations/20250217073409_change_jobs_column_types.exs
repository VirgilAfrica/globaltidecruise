defmodule Globaltide.Repo.Migrations.ChangeJobsColumnTypes do
  use Ecto.Migration

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
