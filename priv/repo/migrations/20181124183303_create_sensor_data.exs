defmodule FarmQ.Repo.Migrations.CreateSensorData do
  use Ecto.Migration

  def change do
    create table(:sensor_data) do
      add :collected_time, :utc_datetime
      add :value, :decimal
      add :parameter_id, references(:parameters, on_delete: :nothing)
      add :bed_id, references(:locations, on_delete: :nothing)
      add :field_bot_id, references(:field_bots, on_delete: :nothing)

      timestamps()
    end

    create index(:sensor_data, [:parameter_id])
    create index(:sensor_data, [:bed_id])
    create index(:sensor_data, [:field_bot_id])
  end
end
