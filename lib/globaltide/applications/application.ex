defmodule Globaltide.Applications.Application do
  use Ecto.Schema
  import Ecto.Changeset

  schema "applications" do
    field :type_of_job, :string  #added field to reference the jobs picked
    field :email, :string
    field :phone, :string
    field :cv_upload, :string
    # Add field for checks
    field :status, :string, default: "Pending"
    # foreign Key to reference Job_listings
    belongs_to :job_listing, Globaltide.JobListing

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(application, attrs) do
    application
    |> cast(attrs, [:type_of_job, :email, :phone, :cv_upload, :job_listing_id])
    |> validate_required([:type_of_job, :email, :phone, :cv_upload,:job_listing_id])
    # Add a foreign Key Constraint
    |> foreign_key_constraint(:job_listing_id)
  end

end
