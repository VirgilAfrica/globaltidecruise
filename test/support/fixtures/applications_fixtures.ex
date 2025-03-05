defmodule Globaltide.ApplicationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Globaltide.Applications` context.
  """

  @doc """
  Generate a application.
  """
  def application_fixture(attrs \\ %{}) do
    {:ok, application} =
      attrs
      |> Enum.into(%{
        cv_upload: "some cv_upload",
        email: "some email",
        phone: "some phone",
        type_of_job: "some type_of_job"
      })
      |> Globaltide.Applications.create_application()

    application
  end
end
