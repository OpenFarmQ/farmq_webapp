defmodule FarmQ.Core.FieldPreparationDataFactory do
  defmacro __using__(_opts) do
    quote do
      def field_preparation_data_factory do
        %FarmQ.Core.FieldPreparationData{
          description: sequence("Description"),
          preparation_date: ~D[2003-11-24],
          crop_cycle: build(:crop_cycle)
        }
      end
    end
  end
end
