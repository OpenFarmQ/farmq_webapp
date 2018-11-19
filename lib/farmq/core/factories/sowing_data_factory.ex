defmodule FarmQ.Core.SowingDataFactory do
  defmacro __using__(_opts) do
    quote do
      def sowing_data_factory do
        %FarmQ.Core.SowingData{
          description: sequence("Description"),
          expected_yield_value: 120.0,
          expected_yield_unit: sequence(:expected_yield_unit, ["Pounds", "Tonnes", "Kilograms"]),
          seed_weight: 123.2,
          sown_date: ~D[2003-11-24],
          plant: build(:plant),
          crop_cycle: build(:crop_cycle)
        }
      end
    end
  end
end
