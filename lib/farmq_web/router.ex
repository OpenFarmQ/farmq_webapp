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

  scope "/", FarmQWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/get-started", PageController, :get_started
    get "/browse", DataController, :index
    get "/docs", DocumentController, :index
    get "/contact", PageController, :contact
    resources "/parameters", ParameterController
    resources "/plants", PlantController

  end

  # Other scopes may use custom stacks.
  # scope "/api", FarmQWeb do
  #   pipe_through :api
  # end
end
