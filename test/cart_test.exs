defmodule CartTest do
  use ExUnit.Case

  alias Cart

  @moduletag :capture_log

  doctest Cart

  test "Can create a Cart" do
    cart = %Cart{}
    assert is_list(cart.content)
  end

  test "Can add a fruit to a cart" do
    cart = Cart.add(%Cart{}, "Pommes")
    assert is_list(cart.content)
  end

  test "Can add several fruit to a cart" do
    cart = Cart.add(%Cart{}, "Pommes")
    cart = Cart.add(cart, "Pommes")
    assert is_list(cart.content)
  end

  test "get price of one article" do
    cart = Cart.add(%Cart{}, "Pommes")
    assert 100 == Cart.price_of_cart(cart)
  end

  test "get price of several articles" do
    cart =
      %Cart{}
      |> Cart.add("Pommes")
      |> Cart.add("Pommes")
      |> Cart.add("Bananes")

    assert 350 == Cart.price_of_cart(cart)
  end

  test "get a reductions for several Cerises" do
    cart =
      %Cart{}
      |> Cart.add("Cerises")
      |> Cart.add("Cerises")

    assert 130 == Cart.price_of_cart(cart)
  end
end
