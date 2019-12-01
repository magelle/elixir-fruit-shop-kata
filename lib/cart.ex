defmodule Cart do
  @moduledoc false

  defstruct content: []

  def add(cart, fruit) do
    %{cart | content: cart.content ++ [fruit]}
  end

  def price_of_cart(cart) do
    cart.content
    |> Enum.map(&Price.price/1)
    |> Enum.sum()
    |> (fn sum -> sum - Discount.all(cart.content) end).()
  end
end
