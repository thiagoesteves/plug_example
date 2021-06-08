defmodule PlugExample.Application do
  @moduledoc false

  use Application

  require Logger

  # ----------------------------------------------------------------------------
  # Public APIs
  # ----------------------------------------------------------------------------

  @doc """
  Launch plug service
  """
  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    port = Application.get_env(:fx_market, :port, 8888)

    # Setup all the children
    children = [
      {Plug.Cowboy,
       scheme: :http, plug: {PlugExample.Router, []}, options: [port: port], otp_app: :http_server}
    ]

    Logger.info("#{inspect(__MODULE__)} created with success")

    # Start up all the children
    opts = [strategy: :one_for_one, name: PlugExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
