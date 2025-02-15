defmodule Globaltide.Repo.Migrations.ChangeLongStringToText do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      modify :shortDesc, :text
      modify :longDesc, {:array, :text}
      modify :sideDesc, {:array, :text}
      modify :Roles, {:array, :text}
      modify :minRequirements, {:array, :text}
    end
  end
end
