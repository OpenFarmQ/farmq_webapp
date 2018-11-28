defmodule FarmQ.Repo.Migrations.RemoveBedAndAddLocation do
  use Ecto.Migration

  def change do
    alter table(:sensor_data) do
      remove :bed_id
      add :location_id, references(:locations, on_delete: :nothing)
    end

    create index(:sensor_data, [:location_id])

  end
end
