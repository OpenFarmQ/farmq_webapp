defmodule FarmQWeb.Router do
  use FarmQWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authorize_user do
    plug FarmQWeb.Plugs.AuthorizeUser
  end

  pipeline :contributor do
    plug :set_contributor_layout
    plug FarmQWeb.Plugs.LoadUser
  end

  scope "/", FarmQWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/get-started", PageController, :get_started
    get "/docs", DocumentController, :index
    get "/contact", PageController, :contact
    get "/dashboard-for-dc", PageController, :dashboard_for_dc

    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete

    get "/csv", CsvController, :export
    get "/browse", DataController, :index


    post "/receive", DataReceiverController, :create

    scope "/contributor" do
      pipe_through :contributor
      pipe_through :authorize_user
      get "/insight", PageController, :farmq_insight
      resources "/field_preparation_data", FieldPreparationDataController
      resources "/sowing_data", SowingDataController
      resources "/harvest_data", HarvestDataController
      resources "/field_clearation_data", FieldClearationDataController
      resources "/locations", LocationController
      resources "/crop_cycles", CropCycleController
      resources "/beds", BedController
      resources "/farms", FarmController
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
