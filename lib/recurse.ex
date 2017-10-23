defmodule Recurse do
  def sum([head | tail], total) do
    sum(tail, total + head)
  end

  def sum([], total), do: total

  def triple([head | tail], list) do
    triple(tail, list ++ [3 * head])
  end

  def triple([], list), do: list
end

IO.puts "Sum: #{Recurse.sum([1, 2, 3, 4, 5], 0)}"
IO.puts "Triple: " <> inspect Recurse.triple([1, 2, 3, 4, 5], [])