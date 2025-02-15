defmodule Globaltide.Repo.Migrations.DropContactMessages do
  use Ecto.Migration

  def up do
    drop table(:contact_messages)
  end

  def down do
    create table(:contact_messages) do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :message, :string

      timestamps(type: :utc_datetime)
    end
  end
end
