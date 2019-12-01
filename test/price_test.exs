defmodule PriceTest do
  use ExUnit.Case

  alias Price

  @moduletag :capture_log

  doctest Price

  test "Pommes costs 100" do
    assert 100 == Price.price("Pommes")
  end

  test "Apples costs 100" do
    assert 100 == Price.price("Apples")
  end

  test "Mele costs 100" do
    assert 100 == Price.price("Mele")
  end

  test "Bananes costs 150" do
    assert 150 == Price.price("Bananes")
  end

  test "Cerises costs 75" do
    assert 75 == Price.price("Cerises")
  end
end
