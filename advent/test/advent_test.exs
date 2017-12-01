defmodule AdventTest do
  use ExUnit.Case
  alias Captha
  doctest Advent

  test "day 1 part 1" do
    assert Captha.solve_1(1111) == 4
    assert Captha.solve_1(1122) == 3
    assert Captha.solve_1(1234) == 0
    assert Captha.solve_1(91212129) == 9

  end
  
  test "day 1 part 2" do
    assert Captha.solve_2(1212) == 6
    assert Captha.solve_2(1221) == 0
    assert Captha.solve_2(123425) == 4
    assert Captha.solve_2(123123) == 12 
    assert Captha.solve_2(12131415) == 4 
  end

end
