defmodule FarmQ.Core.CropCycleFactory do
  defmacro __using__(_opts) do
    quote do
      def crop_cycle_factory do
        %FarmQ.Core.CropCycle{
          name: sequence("CropCycle"),
          bed: build(:bed)
        }
      end
    end
  end
end
