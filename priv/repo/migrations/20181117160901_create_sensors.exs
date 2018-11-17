defmodule FarmQ.Repo.Migrations.CreateSensors do
  use Ecto.Migration

  def change do
    create table(:sensors) do
      add :name, :string
      add :description, :text
      add :url, :string

      timestamps()
    end

    create table(:sensors_parameters, primary_key: false) do
      add :sensor_id, references(:sensors)
      add :parameter_id, references(:parameters)
    end

  end
end
