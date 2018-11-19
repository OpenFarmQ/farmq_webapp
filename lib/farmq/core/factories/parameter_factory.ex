defmodule FarmQ.Core.ParameterFactory do
  defmacro __using__(_opts) do
    quote do
      def parameter_factory do
        %FarmQ.Core.Parameter{
          name: sequence("Parameter"),
          key: sequence("Key"),
          unit: sequence("Unit"),
          description: sequence("Description"),
          data_type: sequence(:data_type, ["String", "Integer", "Decimal"]),

        }
      end
    end
  end
end
