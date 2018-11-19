defmodule FarmQ.Core.Factory do
  use ExMachina.Ecto, repo: MyApp.Repo

  use FarmQ.Core.PlantFactory
  use FarmQ.Core.ParameterFactory
  use FarmQ.Core.SensorFactory

  use FarmQ.Core.FarmFactory
  use FarmQ.Core.BedFactory
  use FarmQ.Core.FieldBotFactory

  use FarmQ.Core.CropCycleFactory
  use FarmQ.Core.FieldPreparationDataFactory
  use FarmQ.Core.SowingDataFactory
  use FarmQ.Core.HarvestDataFactory
  use FarmQ.Core.FieldClearationDataFactory


end
