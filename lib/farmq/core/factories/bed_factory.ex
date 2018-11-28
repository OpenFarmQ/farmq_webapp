defmodule FarmQ.Core.BedFactory do
  defmacro __using__(_opts) do
    quote do
      def bed_factory do
        %FarmQ.Core.Location{
          name: sequence("Bed"),
          type: "Bed",
          description: sequence("Description"),
          area: sequence(:area, [10.0, 80.0, 300.0]),
          latitude: sequence(:latitude, [123.6, 482.4, 519.0]),
          longitude: sequence(:longitude, [410.5, 131.8, 142.3]),
          parent: build(:farm)
        }
      end
    end
  end
end
