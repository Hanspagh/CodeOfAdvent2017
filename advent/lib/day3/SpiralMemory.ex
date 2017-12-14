defmodule SpiralMemory do

  
  def solve(input) do
    range =  for n <- 1..2000, do: n * 2 - 1

    res = Enum.map(range, fn e -> e*4 + 4 end)
    |> Enum.reduce_while({0,1}, fn e,{c,n} = acc -> if n >= input, do: {:halt, acc}, else: {:cont, {c+1 , n+e}} end)
    
    
    
    up = elem(res, 0)
    left = up - (elem(res,1) - input) 
    {left,up}
    
  end


end