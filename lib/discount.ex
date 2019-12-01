defmodule Discount do
  @moduledoc false

  def all(fruits) do
    allDiscount()
    |> Enum.map(fn discount -> discount.(fruits) end)
    |> Enum.sum()
  end

  defp allDiscount() do
    [
      &cerises_discount/1,
      &bananes_discount/1,
      &apple_discount/1,
      &mele_discount/1,
      &super_pommes_discount/1,
      &super_fruits_discount/1
    ]
  end

  defp cerises_discount(fruits) do
    discount_per_lot(fruits, ["Cerises"], 2, 20)
  end

  defp bananes_discount(fruits) do
    discount_per_lot(fruits, ["Bananes"], 2, 150)
  end

  defp apple_discount(fruits) do
    discount_per_lot(fruits, ["Apples"], 3, 100)
  end

  defp mele_discount(fruits) do
    discount_per_lot(fruits, ["Mele"], 2, 100)
  end

  defp super_pommes_discount(fruits) do
    discount_per_lot(fruits, ["Mele", "Pommes", "Apples"], 4, 100)
  end

  defp super_fruits_discount(fruits) do
    div(length(fruits), 5) * 200
  end

  def discount_per_lot(fruits, fruitNames, lotCount, discount) do
    div(count_fruit(fruits, fruitNames), lotCount) * discount
  end

  defp count_fruit(fruits, fruitNames) do
    Enum.count(fruits, fn f -> Enum.any?(fruitNames, fn name -> f == name end) end)
  end
end
