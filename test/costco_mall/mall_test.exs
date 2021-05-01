defmodule CostcoMall.MallTest do
  use CostcoMall.DataCase

  alias CostcoMall.Mall

  describe "carts" do
    alias CostcoMall.Mall.Cart

    @valid_attrs %{count: 42, total: 42}
    @update_attrs %{count: 43, total: 43}
    @invalid_attrs %{count: nil, total: nil}

    def cart_fixture(attrs \\ %{}) do
      {:ok, cart} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Mall.create_cart()

      cart
    end

    test "list_carts/0 returns all carts" do
      cart = cart_fixture()
      assert Mall.list_carts() == [cart]
    end

    test "get_cart!/1 returns the cart with given id" do
      cart = cart_fixture()
      assert Mall.get_cart!(cart.id) == cart
    end

    test "create_cart/1 with valid data creates a cart" do
      assert {:ok, %Cart{} = cart} = Mall.create_cart(@valid_attrs)
      assert cart.count == 42
      assert cart.total == 42
    end

    test "create_cart/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mall.create_cart(@invalid_attrs)
    end

    test "update_cart/2 with valid data updates the cart" do
      cart = cart_fixture()
      assert {:ok, %Cart{} = cart} = Mall.update_cart(cart, @update_attrs)
      assert cart.count == 43
      assert cart.total == 43
    end

    test "update_cart/2 with invalid data returns error changeset" do
      cart = cart_fixture()
      assert {:error, %Ecto.Changeset{}} = Mall.update_cart(cart, @invalid_attrs)
      assert cart == Mall.get_cart!(cart.id)
    end

    test "delete_cart/1 deletes the cart" do
      cart = cart_fixture()
      assert {:ok, %Cart{}} = Mall.delete_cart(cart)
      assert_raise Ecto.NoResultsError, fn -> Mall.get_cart!(cart.id) end
    end

    test "change_cart/1 returns a cart changeset" do
      cart = cart_fixture()
      assert %Ecto.Changeset{} = Mall.change_cart(cart)
    end
  end
end
