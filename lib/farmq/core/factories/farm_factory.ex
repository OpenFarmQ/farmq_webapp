defmodule FarmQ.Core.FarmFactory do
  defmacro __using__(_opts) do
    quote do
      def farm_factory do
        %FarmQ.Core.Location{
          name: sequence("Location"),
          type: "Farm",
          description: sequence("Description"),
          area: 100.0,
          latitude: 123.6,
          longitude: 417.3
        }
      end
    end
  end
end
