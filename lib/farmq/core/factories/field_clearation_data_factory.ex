defmodule FarmQ.Core.FieldClearationDataFactory do
  defmacro __using__(_opts) do
    quote do
      def field_clearation_data_factory do
        %FarmQ.Core.FieldClearationData{
          description: sequence("Description"),
          clearation_date: Date.utc_today |> Date.add(21),
          crop_cycle: build(:crop_cycle)
        }
      end
    end
  end
end
