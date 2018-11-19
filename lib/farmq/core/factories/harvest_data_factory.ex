defmodule FarmQ.Core.HarvestDataFactory do
  defmacro __using__(_opts) do
    quote do
      def harvest_data_factory do
        %FarmQ.Core.HarvestData{
          description: sequence("Description"),
          actual_yield_value: 120.0,
          actual_yield_unit: sequence(:expected_yield_unit, ["Pounds", "Tonnes", "Kilograms"]),
          yield_quality: sequence(:yield_quality, ["Good", "Bad", "Ok"]),
          harvest_date: ~D[2004-3-14],
          crop_cycle: build(:crop_cycle)
        }
      end
    end
  end
end
