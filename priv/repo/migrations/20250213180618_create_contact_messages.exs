defmodule Globaltide.Repo.Migrations.CreateContactMessages do
  use Ecto.Migration

  def change do
    create table(:contact_messages) do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :message, :text

      timestamps(type: :utc_datetime)
    end
  end
end
