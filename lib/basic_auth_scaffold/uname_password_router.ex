defmodule UnamePasswordRouter do
  use Plug.Router

  plug BasicAuth, use_config: {:basic_auth_scaffold, :uname_password}

  plug :match
  plug :dispatch


  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http __MODULE__, [], [port: 4500]
  end

  get "/" do
    send_resp(conn, 200, "hello\n")
  end

  match _ do
    send_resp(conn, 404, "¯\\(°_o)/¯\n")
  end
end
