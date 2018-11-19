defmodule FarmQ.Core.HarvestDataFactory do
  defmacro __using__(_opts) do
    quote do
      def harvest_data_factory do
        %FarmQ.Core.HarvestData{
          description: sequence("Description"),
          actual_yield_value: sequence(:actual_yield_value, [100.0, 23.6, 90.9])
          actual_yield_unit: "Kilo grams",
          yield_quality: sequence(:yield_quality, ["Good", "Bad", "Ok"]),
          harvest_date: Date.utc_today() |> Date.add(14),
          crop_cycle: build(:crop_cycle)
        }
      end
    end
  end
end
