defmodule FarmQ.Core.SowingDataFactory do
  defmacro __using__(_opts) do
    quote do
      def sowing_data_factory do
        %FarmQ.Core.SowingData{
          description: sequence("Description"),
          expected_yield_value: sequence(:expected_yield_value, [100.0, 23.6, 90.9]),
          expected_yield_unit: "Kilo grams",
          seed_weight: sequence(:seed_weight, [183.0, 97.0, 32.9]),
          sown_date: Date.utc_today() |> Date.add(7),
          plant: build(:plant),
          crop_cycle: build(:crop_cycle)
        }
      end
    end
  end
end
