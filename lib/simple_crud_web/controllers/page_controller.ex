defmodule SimpleCrudWeb.PageController do
  use SimpleCrudWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
