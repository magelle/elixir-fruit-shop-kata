defmodule Main do
  @moduledoc false

  def main() do
    Stream.repeatedly(&get_fruit/0)
    |> Enum.reduce(%Cart{}, &add_and_get_price/2)
  end

  def get_fruit() do
    IO.gets("Please, enter a fruit name : ")
    |> String.split(",")
    |> Enum.map(&String.trim/1)
  end

  def add_and_get_price(fruits, cart) do
    new_cart = Enum.reduce(fruits, cart, fn fruit, cart -> Cart.add(cart, fruit) end)
    IO.puts(Cart.price_of_cart(new_cart))
    new_cart
  end
end
