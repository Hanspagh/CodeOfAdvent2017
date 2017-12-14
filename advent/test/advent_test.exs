defmodule AdventTest do
  use ExUnit.Case
  alias Captha
  alias CorruptionChecksum
  alias HighEntropyPassphrases
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

  test "day 2 part 1" do
    assert 18 == CorruptionChecksum.solve("5\t1\t9\t5\n7\t5\t3\n2\t4\t6\t8")
  end

  test "day 2 part 2" do
    assert 18 == CorruptionChecksum.solve2("5\t9\t2\t8\n9\t4\t7\t3\n3\t8\t6\t5")
  end

  test "day 4 part 1" do
    assert 1 == HighEntropyPassphrases.solve("aa bb cc dd ee")
    assert 0 == HighEntropyPassphrases.solve("aa bb cc dd ee aa")
    assert 1 == HighEntropyPassphrases.solve("aa bb cc dd ee aaa")
  end
  
  test "day 4 part 2" do
    assert 1 == HighEntropyPassphrases.solve2("abcde fghij")
    assert 0 == HighEntropyPassphrases.solve2("abcde xyz ecdab")
    assert 1 == HighEntropyPassphrases.solve2("a ab abc abd abf abj")
  end
end
