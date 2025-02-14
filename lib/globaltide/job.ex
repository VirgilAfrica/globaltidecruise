defmodule Globaltide.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :req, :string
    field :imgRef, :string
    field :jobTag, :string
    field :jobTitle, :string
    field :shortDesc, :string
    field :longDesc, {:array, :string}
    field :btn, :string
    field :heading, {:array, :string}
    field :Roles, {:array, :string}
    field :minRequirements, {:array, :string}
    field :sideHead, {:array, :string}
    field :sideDesc, {:array, :string}
    field :sideLogo, {:array, :string}

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:imgRef, :jobTag, :jobTitle, :shortDesc, :longDesc, :btn, :heading, :Roles, :minRequirements, :req, :sideHead, :sideDesc, :sideLogo])
    |> validate_required([:imgRef, :jobTag, :jobTitle, :shortDesc, :longDesc, :btn, :heading, :Roles, :minRequirements, :req, :sideHead, :sideDesc, :sideLogo])
  end
end
