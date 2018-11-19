defmodule FarmQ.Core.FieldBotFactory do
  defmacro __using__(_opts) do
    quote do
      def field_bot_factory do
        %FarmQ.Core.FieldBot{
          name: sequence("FieldBot"),
          bed: build(:bed)
        }
      end
    end
  end
end
