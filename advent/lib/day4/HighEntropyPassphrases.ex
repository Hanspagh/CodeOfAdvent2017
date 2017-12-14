defmodule HighEntropyPassphrases do

  def solve(input) do
    parse(input)
    |> Enum.map(fn elem -> duplicates?(elem, &Enum.member?/2) end)
    |> Enum.reduce(0, fn elem, acc -> if elem, do: acc, else: acc+1 end)
  end
  
  def solve2(input) do
    parse(input)
    |> Enum.map(fn elem -> duplicates?(elem, &anagram_member?/2) end)
    |> Enum.reduce(0, fn elem, acc -> if elem, do: acc, else: acc+1 end)
  end

  def duplicates?([head|tail], fun) do
    fun.(tail, head) or duplicates?(tail, fun)
  end
  
  def duplicates?([], _fun) do
    false
  end

  def anagram_member?(list, elem) do
    Enum.any?(list, &anagram(&1, elem))
  end

  def anagram(e1, e2) do
    Enum.sort(String.codepoints(e1))  == Enum.sort(String.codepoints(e2))
  end

  def parse(input) do
    String.split(input, "\n")
    |> Enum.map(&String.split(&1, " "))
  end




  
end