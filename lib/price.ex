defmodule Price do
  @moduledoc false

  def price("Pommes") do
    100
  end

  def price("Apples") do
    100
  end

  def price("Mele") do
    100
  end

  def price("Bananes") do
    150
  end

  def price("Cerises") do
    75
  end

  def price(_) do
    0
  end
end
