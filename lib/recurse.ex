defmodule Recurse do
  def sum([head | tail], total) do
    sum(tail, total + head)
  end

  def sum([], total), do: total

  def triple([head | tail], list) do
    triple(tail, list ++ [3 * head])
  end

  def triple([], list), do: list

  def my_map([head | tail], func) do
    [func.(head) | my_map(tail, func)]
  end

  def my_map([], func), do: []
end

IO.puts "Sum: #{Recurse.sum([1, 2, 3, 4, 5], 0)}"
IO.puts "Triple: " <> inspect Recurse.triple([1, 2, 3, 4, 5], [])
IO.puts "Map: " <> inspect Recurse.my_map([1, 2, 3, 4, 5], &(&1 * 2))
IO.puts "Map: " <> inspect Recurse.my_map([1, 2, 3, 4, 5], &(&1 * 5))