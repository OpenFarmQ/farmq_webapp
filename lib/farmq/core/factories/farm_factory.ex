defmodule FarmQ.Core.FarmFactory do
  defmacro __using__(_opts) do
    quote do
      def farm_factory do
        %FarmQ.Core.Location{
          name: sequence("Farm"),
          type: "Farm",
          description: sequence("Description"),
          area: sequence(:area, [1000.0, 3500.0, 495.6]),
          latitude: sequence(:latitude, [123.6, 482.4, 519.0]),
          longitude: sequence(:longitude, [410.5, 131.8, 142.3])
        }
      end
    end
  end
end
