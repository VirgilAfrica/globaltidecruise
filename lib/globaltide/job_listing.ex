defmodule Globaltide.JobListing do
  use Ecto.Schema
  import Ecto.Changeset

  schema "job_listings" do
    field :req, :string
    field :img_ref, :string
    field :job_tag, :string
    field :job_title, :string
    field :short_desc, :string
    field :long_desc, {:array, :string}
    field :btn, :string
    field :heading, {:array, :string}
    field :roles, {:array, :string}
    field :min_requirements, {:array, :string}
    field :side_head, {:array, :string}
    field :side_desc, {:array, :string}
    field :side_logo, {:array, :string}

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(job_listing, attrs) do
    job_listing
    |> cast(attrs, [:img_ref, :job_tag, :job_title, :short_desc, :long_desc, :btn, :heading, :roles, :min_requirements, :req, :side_head, :side_desc, :side_logo])
    |> validate_required([:img_ref, :job_tag, :job_title, :short_desc, :long_desc, :btn, :heading, :roles, :min_requirements, :req, :side_head, :side_desc, :side_logo])
  end
end
