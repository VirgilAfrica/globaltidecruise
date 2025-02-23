# # Script for populating the database. You can run it as:
# #
# #     mix run priv/repo/seeds.exs
# #
# # Inside the script, you can read and write to any of your
# # repositories directly:
# #
# #     Globaltide.Repo.insert!(%Globaltide.SomeSchema{})
# #
# # We recommend using the bang functions ("insert!", "update!"
# # and so on) as they will fail if something goes wrong.

alias Globaltide.Repo
alias Globaltide.Job

jobs = [
 
]

Enum.each(jobs, fn job ->
  changeset = Job.changeset(%Job{}, job)
  Repo.insert!(changeset)
end)
