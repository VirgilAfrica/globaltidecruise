defmodule Globaltide.Repo.Migrations.ChangeShortDescStringToText do
  use Ecto.Migration

  def up do
    alter table(:jobs) do
      modify :shortDesc, :text,
        from: {:array, :string},
        using: "array_to_string(shortDesc, ' ')"
    end
  end

  def down do
    alter table(:jobs) do
      modify :shortDesc, {:array, :string},
        from: :text,
        using: "string_to_array(shortDesc, ' ')"
    end
  end
end
