defmodule FarmQWeb.Router do
  use FarmQWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :contributor do
    plug :set_contributor_layout
  end

  scope "/", FarmQWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/get-started", PageController, :get_started
    get "/browse", DataController, :index
    get "/docs", DocumentController, :index
    get "/contact", PageController, :contact
    get "/dashboard-for-dc", PageController, :dashboard_for_dc


    scope "/contributor" do
      pipe_through :contributor
      get "/", PageController, :farmq_insight
      resources "/crop_cycles", CropCycleController
      resources "/field_preparation_data", FieldPreparationDataController
      resources "/sowing_data", SowingDataController
      resources "/harvest_data", HarvestDataController
      resources "/field_clearation_data", FieldClearationDataController

      resources "/locations", LocationController
      resources "/farms", FarmController
      resources "/beds", BedController
      resources "/field_bots", FieldBotController

      resources "/plants", PlantController
      resources "/parameters", ParameterController
      resources "/sensors", SensorController
    end

  end

  defp set_contributor_layout(conn, _params) do
    conn
    |> put_layout({FarmQWeb.LayoutView, :contributor_app})
  end

  # Other scopes may use custom stacks.
  # scope "/api", FarmQWeb do
  #   pipe_through :api
  # end
end
