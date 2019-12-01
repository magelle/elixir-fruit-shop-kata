defmodule DiscountTest do
  use ExUnit.Case

  alias Discount

  @moduletag :capture_log

  doctest Discount

  test "nothing == no discount" do
    assert 0 == Discount.discount_per_lot([], ["fruit"], 1, 100)
  end

  test "no discount if only one" do
    assert 0 == Discount.discount_per_lot(["fruit"], ["fruit"], 2, 100)
  end

  test "one discount" do
    assert 100 == Discount.discount_per_lot(["fruit", "fruit"], ["fruit"], 2, 100)
  end

  test "reduction for several lot, but not twice the discount" do
    assert 100 == Discount.discount_per_lot(["fruit", "fruit"], ["fruit"], 2, 100)
  end

  test "twice the discount" do
    assert 200 ==
             Discount.discount_per_lot(["fruit", "fruit", "fruit", "fruit"], ["fruit"], 2, 100)
  end

  test "discount on fruit group" do
    assert 100 ==
             Discount.discount_per_lot(
               ["fruit", "pommes", "cerises"],
               ["pommes", "cerises"],
               2,
               100
             )
  end
end
