defmodule Problems.ProblemsTest do
  use ProblemsWeb.ConnCase

  test "check insertion sort" do
    list = [7, 3, 2, 4, 6, 9, 1, 0]
    expected = [0, 1, 2, 3, 4, 6, 7, 9]

    assert Problems.InsertionSort.order_list(list) == expected
  end
end
