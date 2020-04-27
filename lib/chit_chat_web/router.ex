defmodule ChitChatWeb.Router do
  use ChitChatWeb, :router

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

  scope "/", ChitChatWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/rooms", RoomController
    resources "/users", UserController
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ChitChatWeb.Telemetry
    end
  end
end
