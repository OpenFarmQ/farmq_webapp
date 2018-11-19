defmodule FarmQ.Core.Factory do
  use ExMachina.Ecto, repo: MyApp.Repo

  use FarmQ.Core.PlantFactory

end
