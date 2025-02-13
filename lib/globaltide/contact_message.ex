defmodule Globaltide.ContactMessage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contact_messages" do
    field :message, :string
    field :name, :string
    field :email, :string
    field :phone, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(contact_message, attrs) do
    contact_message
    |> cast(attrs, [:name, :email, :phone, :message])
    |> validate_required([:name, :email, :phone, :message])
  end
end
