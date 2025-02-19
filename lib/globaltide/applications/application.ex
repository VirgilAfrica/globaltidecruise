defmodule Globaltide.Applications.Application do
  use Ecto.Schema
  import Ecto.Changeset

  schema "applications" do
    field :job_name, :string
    field :cv, :string
    field :cover_letter, :string
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(application, attrs) do
    application
    |> cast(attrs, [:job_name, :cv, :cover_letter])
    |> validate_required([:job_name, :cv, :cover_letter])
  end
end
