defmodule Globaltide.JobsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Globaltide.Jobs` context.
  """

  @doc """
  Generate a job.
  """
  def job_fixture(attrs \\ %{}) do
    {:ok, job} =
      attrs
      |> Enum.into(%{

      })
      |> Globaltide.Jobs.create_job()

    job
  end
end
