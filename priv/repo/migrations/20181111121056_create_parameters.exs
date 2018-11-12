defmodule FarmQ.Repo.Migrations.CreateParameters do
  use Ecto.Migration

  def change do
    create table(:parameters) do
      add :name, :string
      add :key, :string
      add :description, :text
      add :unit, :string
      add :data_type, :string

      timestamps()
    end

  end
end
