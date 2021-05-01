defmodule CostcoMallWeb.CartControllerTest do
  use CostcoMallWeb.ConnCase

  alias CostcoMall.Mall
  alias CostcoMall.Mall.Cart

  @create_attrs %{
    count: 42,
    total: 42
  }
  @update_attrs %{
    count: 43,
    total: 43
  }
  @invalid_attrs %{count: nil, total: nil}

  def fixture(:cart) do
    {:ok, cart} = Mall.create_cart(@create_attrs)
    cart
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all carts", %{conn: conn} do
      conn = get(conn, Routes.cart_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cart" do
    test "renders cart when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cart_path(conn, :create), cart: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.cart_path(conn, :show, id))

      assert %{
               "id" => id,
               "count" => 42,
               "total" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cart_path(conn, :create), cart: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cart" do
    setup [:create_cart]

    test "renders cart when data is valid", %{conn: conn, cart: %Cart{id: id} = cart} do
      conn = put(conn, Routes.cart_path(conn, :update, cart), cart: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.cart_path(conn, :show, id))

      assert %{
               "id" => id,
               "count" => 43,
               "total" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, cart: cart} do
      conn = put(conn, Routes.cart_path(conn, :update, cart), cart: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cart" do
    setup [:create_cart]

    test "deletes chosen cart", %{conn: conn, cart: cart} do
      conn = delete(conn, Routes.cart_path(conn, :delete, cart))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.cart_path(conn, :show, cart))
      end
    end
  end

  defp create_cart(_) do
    cart = fixture(:cart)
    %{cart: cart}
  end
end
