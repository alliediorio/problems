defmodule Problems.InsertionSort do
  # * Insertion sort is a basic sorting algorithm.
  # *
  # * Insertion sort iterates over an array, growing a sorted array behind the current location.
  # * It takes each element from the input and finds the spot, up to the current point,
  # * where that element belongs. It does this until it gets to the end of the array.
  # *
  # * Insertion sort should be implemented as a stable sort. This means that equal elements
  # * should retain their relative order. Numbers, as primitives, give us no way to check this,
  # * so we'll be sorting objects with a value field, on which they will be sorted, like so:
  # *
  # * `[{value: 10}, {value: 5, order: 1}, {value: 5, order: 2}]`
  # *
  # * A stable sort must return `{value: 5, order: 1}, {value:5, order: 2}` in that order.
  # *
  # * ---
  # *
  # * EXTRA CREDIT:
  # *
  # * Refactor your sort to (optionally) take an explicit comparator function
  # * as its second argument, so that callers can define arbitrary ways to sort elements.
  # * See [Array.prototype.sort](http://devdocs.io/javascript/global_objects/array/sort)
  # * for an example of how this works (excerpt below):
  # *
  # * > If `comparator(a, b)` is less than `0`, sort `a` to a lower index than `b`, i.e. `a` comes first.
  # * > If `comparator(a, b)` returns `0`, leave `a` and `b` unchanged with respect to each other, but sorted with respect to all different elements.
  # * > If `comparator(a, b)` is greater than `0`, sort `b` to a lower index than `a`.
  # *
  # * If no comparator is given, just sort the elements using `<` or `>`.
  # **/

  # // Example usage:
  # // insertionSort([{value: 2}, {value: 1}, {value: 3}]);
  # // yields [{value: 1}, {value: 2}, {value: 3}]'

  def order_list(list) do
    _order_list(list, [])
  end

  def _order_list([], acc) do
    acc
  end

  def _order_list([head | tail], []) do
    _order_list(tail, [head])
  end

  def _order_list([head | tail], [acc_head | acc_tail] = acc) do
    if head < acc_head do
      _order_list(tail, [head | acc])
    else
      _order_list(tail, [acc_head | check_rem(head, acc_tail, [])])
    end
  end

  def check_rem(num, [], acc) do
    acc ++ [num]
  end

  def check_rem(num, [head | tail] = rem, acc) do
    if num < head do
      acc ++ [num | rem]
    else
      check_rem(num, tail, acc ++ [head])
    end
  end
end
