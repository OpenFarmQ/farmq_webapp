defmodule FarmQ.Repo.Migrations.CreateFieldBots do
  use Ecto.Migration

  def change do
    create table(:field_bots) do
      add :name, :string
      add :location_id, references(:locations, on_delete: :nothing)
      add :bed_id, references(:beds, on_delete: :nothing)

      timestamps()
    end

    create index(:field_bots, [:location_id])
    create index(:field_bots, [:bed_id])
  end
end
