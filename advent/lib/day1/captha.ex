defmodule Captha do


  def solve_1(input) do
    do_solve(input,&next_element/2)
  end

  def solve_2(input) do
    do_solve(input,&next_element_half_way/2)
  end

  

  def do_solve(input, next_element_fun) do
    
    parsed_input = 
    input 
    |> Integer.to_string()
    |> String.codepoints
    |> Enum.map(&String.to_integer/1)
    
    parsed_input
    |> Enum.with_index()
    |> Enum.filter(fn {e,i} -> next_element_fun.(parsed_input,i) == e end)
    |> Enum.map(fn {e,_} -> e end)
    |> Enum.sum()
    
  end
  
  def next_element(list, index, skip \\1) do
    #makes the list wrap around
    (list ++ list)
    |> Enum.at(index+skip) 
  end

  def next_element_half_way(list,index) do
    next = Integer.floor_div(Enum.count(list),2)
    next_element(list,index,next)
  end
end


