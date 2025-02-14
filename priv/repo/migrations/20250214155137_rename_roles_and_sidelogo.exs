defmodule Globaltide.Repo.Migrations.RenameRolesAndSidelogo do
  use Ecto.Migration

  def change do
    rename table(:jobs), :roles, to: :Roles
    rename table(:jobs), :sidelogo, to: :sideLogo
  end
end
