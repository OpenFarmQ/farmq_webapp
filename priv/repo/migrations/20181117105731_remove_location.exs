defmodule FarmQ.Repo.Migrations.RemoveLocation do
  use Ecto.Migration

  def change do

    alter table(:field_bots) do
      remove :location_id
      remove :bed_id
    end
    
    drop table(:beds)
    drop table(:locations)
  end
end
