defmodule CorruptionChecksum do



  def parse(input) do
    lines = String.split(input, "\n")
    Enum.map(lines, fn e -> String.split(e, "\t") |> Enum.map(&String.to_integer/1) end)
  end

  def solve(input) do
    input
    |> parse()
    |> Enum.map(fn e -> Enum.reduce(e,{99999,0}, &find_min_max/2) end)
    |> Enum.map(fn {low,high} -> high - low end)
    |> Enum.sum()
  end

  def find_min_max(e, {low, high} = acc) do
    cond do
      e > high && e < low -> {e,e}
      e > high -> {low,e}
      e < low -> {e, high}
      true -> {low,high}
    end
  end

  def solve2(input) do
    parse(input)
    |> Enum.map(&find_divisor/1)
    |> Enum.sum()
  end

  def find_divisor(list) do
    Enum.flat_map(list, fn e -> Enum.map(list, fn e2 -> {Integer.mod(e2,e), e2/e} end) end)
    |> Enum.find(fn {r,e} -> e != 1.0 and r == 0 end)
    |> elem(1)
  end





end