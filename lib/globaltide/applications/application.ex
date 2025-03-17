defmodule Globaltide.Applications.Application do
  use Ecto.Schema
  import Ecto.Changeset

  schema "applications" do
    field :email, :string
    field :phone, :string
    field :cv_upload, :string
    field :status, :string, default: "Pending"

    # Foreign Key to reference Job Listings
    belongs_to :job_listing, Globaltide.JobListing

    # Foreign Key to reference Users (Missing Field Added)
    belongs_to :user, Globaltide.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(application, attrs) do
    application
    |> cast(attrs, [ :email, :phone, :cv_upload, :job_listing_id, :user_id])
    |> validate_required([:email, :phone, :cv_upload, :job_listing_id, :user_id])
    |> foreign_key_constraint(:job_listing_id)
    |> foreign_key_constraint(:user_id)
  end
end
