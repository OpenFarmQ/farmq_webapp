defmodule FarmQ.Core.PlantFactory do
  defmacro __using__(_opts) do
    quote do
      def article_factory do
        %FarmQ.Core.Plant{
          name: sequence("Plant"),
          binomial_name: sequence("Two name"),
          common_name: ["hand plant", "leg plant"],
          description: sequence("Description"),
          image: sequence("image"),
          source_name: sequence("souce 1"),
          source_url: sequence(:source_url, &"source-url#{&1}.com"),
          data_scrapper_id: sequence("scrapper-id")
        }
      end
    end
  end
end
