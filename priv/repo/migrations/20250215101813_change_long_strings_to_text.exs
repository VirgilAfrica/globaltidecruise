defmodule Globaltide.Repo.Migrations.ChangeLongStringsToText do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      modify :shortDesc, {:array, :text}
      modify :longDesc, {:array, :text}
      modify :sideDesc, {:array, :text}
      modify :Roles, {:array, :text}
      modify :minRequirements, {:array, :text}
    end
  end
end
