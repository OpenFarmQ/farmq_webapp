defmodule FarmQ.Repo.Migrations.CreateBeds do
  use Ecto.Migration

  def change do
    create table(:beds) do
      add :name, :string
      add :area, :decimal
      add :status, :string
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create index(:beds, [:location_id])
  end
end
