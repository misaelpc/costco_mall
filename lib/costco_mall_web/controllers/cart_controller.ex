defmodule CostcoMallWeb.CartController do
  use CostcoMallWeb, :controller

  alias CostcoMall.Mall
  alias CostcoMall.Mall.Cart

  action_fallback CostcoMallWeb.FallbackController

  def index(conn, _params) do
    carts = Mall.list_carts()
    render(conn, "index.json", carts: carts)
  end

  def create(conn, %{"cart" => cart_params}) do
    with {:ok, %Cart{} = cart} <- Mall.create_cart(cart_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.cart_path(conn, :show, cart))
      |> render("show.json", cart: cart)
    end
  end

  def show(conn, %{"id" => id}) do
    cart = Mall.get_cart!(id)
    render(conn, "show.json", cart: cart)
  end

  def update(conn, %{"id" => id, "cart" => cart_params}) do
    cart = Mall.get_cart!(id)

    with {:ok, %Cart{} = cart} <- Mall.update_cart(cart, cart_params) do
      render(conn, "show.json", cart: cart)
    end
  end

  def delete(conn, %{"id" => id}) do
    cart = Mall.get_cart!(id)

    with {:ok, %Cart{}} <- Mall.delete_cart(cart) do
      send_resp(conn, :no_content, "")
    end
  end
end
