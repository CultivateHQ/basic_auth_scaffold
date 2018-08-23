defmodule TokenOnlyRouter do
  @moduledoc """
  Not using Basic Auth. This just looks for a single `www-authenticate` header and checks if it matches "letmein"
  Command line usage:

  ```
  curl -H "authorization: letmein" localhost:4502
  ```

  """

  use Plug.Router
  plug(:check_token)

  plug(:match)
  plug(:dispatch)

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy2.http(__MODULE__, [], port: 4502)
  end

  get "/" do
    send_resp(conn, 200, "hello\n")
  end

  match _ do
    send_resp(conn, 404, "¯\\(°_o)/¯\n")
  end

  defp check_token(conn, _opts) do
    header_content = Plug.Conn.get_req_header(conn, "authorization")

    conn
    |> check_authorisation(header_content)
  end

  defp check_authorisation(conn, ["letmein"]), do: conn

  defp check_authorisation(conn, _) do
    conn
    |> Plug.Conn.send_resp(401, "Get out of here!\n")
    |> Plug.Conn.halt()
  end
end
