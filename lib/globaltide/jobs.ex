defmodule Globaltide.Jobs do
  import Ecto.Query
  alias Globaltide.Repo
  alias Globaltide.Applications.Application

  def get_user_applications(user_id) do
    Repo.all(
      from a in Application,
        where: a.user_id == ^user_id,
        preload: [:job_listing]  
    )
  end

end
