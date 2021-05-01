defmodule CostcoMallWeb.PageController do
  use CostcoMallWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
