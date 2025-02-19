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
        cover_letter: "some cover_letter",
        cv: "some cv",
        job_name: "some job_name"
      })
      |> Globaltide.Applications.create_application()

    application
  end
end
