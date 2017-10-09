defmodule CallbackRouter do
  use Plug.Router

  plug BasicAuth, callback: &CallbackRouter.check_username_password/3

  plug :match
  plug :dispatch


  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http __MODULE__, [], [port: 4501]
  end

  get "/" do
    send_resp(conn, 200, "hello\n")
  end

  match _ do
    send_resp(conn, 404, "¯\\(°_o)/¯\n")
  end

  def check_username_password(conn, "admin", "password"), do: conn
  def check_username_password(conn, _, _), do: Plug.Conn.halt(conn)
end
