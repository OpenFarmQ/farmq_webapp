defmodule FarmQWeb.Plugs.LoadUser do
  alias Plug.Conn
  alias FarmQ.Core
  def init(_opts) do
    nil
  end

  def call(%Conn{} = conn, _opts) do
    user_id = Conn.get_session(conn, :user_id)
    user = user_id && Core.get_user(user_id)
    Conn.assign(conn, :current_user, user)
  end
end
