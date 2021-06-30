defmodule TackleBoxCds.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :hook, :string, null: false
      add :title, :string
      add :description, :string, null: false
      add :prefetch, :map
      add :url, :string

      timestamps()
    end

  end
end
