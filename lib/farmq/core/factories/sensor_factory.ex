defmodule FarmQ.Core.SensorFactory do
  defmacro __using__(_opts) do
    quote do
      def sensor_factory do
        %FarmQ.Core.Sensor{
          name: sequence("Sensor"),
          description: sequence("Description"),
          url: sequence(:url, &"url#{&1}.com"),
          parameters: [build(:parameter)]
        }
      end
    end
  end
end
