defmodule FarmQ.Core.BedFactory do
  defmacro __using__(_opts) do
    quote do
      def bed_factory do
        %FarmQ.Core.Location{
          name: sequence("Bed"),
          type: "Bed",
          description: sequence("Description"),
          area: 10.0,
          latitude: 123.6,
          longitude: 417.3,
          parent: build(:farm)
        }
      end
    end
  end
end
