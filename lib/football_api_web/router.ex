defmodule FootballApiWeb.Router do
  use FootballApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FootballApiWeb do
    pipe_through :api

    get "/players", PlayersController, :index
    get "/players/:id", PlayersController, :show
    get "/clubs/:id/players", PlayersController, :index_by_club

    get "/clubs", ClubsController, :index
    get "/clubs/:id", ClubsController, :show
    get "/leagues/:id/clubs", ClubsController, :index_by_league

    get "/leagues", LeaguesController, :index
    get "/leagues/:id", LeaguesController, :show

    get "/fixtures", FixturesController, :index
    get "/fixtures/:id", FixturesController, :show
    get "/leagues/:id/fixtures", FixturesController, :index_by_league

    get "/league_table/:id", TablesController, :index_by_league

  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:football_api, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: FootballApiWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
