defmodule Globaltide.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field :message, :string
    field :name, :string
    field :email, :string
    field :phone, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:name, :email, :phone, :message])
    |> validate_required([:name, :email, :phone, :message])
  end
end
