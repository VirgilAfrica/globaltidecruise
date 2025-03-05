defmodule Globaltide.Applications.Application do
  use Ecto.Schema
  import Ecto.Changeset

  schema "applications" do
    field :type_of_job, :string
    field :email, :string
    field :phone, :string
    field :cv_upload, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(application, attrs) do
    application
    |> cast(attrs, [:type_of_job, :email, :phone, :cv_upload])
    |> validate_required([:type_of_job, :email, :phone, :cv_upload])
  end
end
