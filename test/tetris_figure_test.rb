require 'minitest/autorun'
require_relative '../tetris_figure'

class TestTetrisFigure < Minitest::Test

  def test_new_raises_argument_error_when_data_is_not_an_array
    assert_raises ArgumentError do
      TetrisFigure.new 123
    end
  end

  def test_new_raises_argument_error_when_data_is_one_level_array
    assert_raises ArgumentError do
      TetrisFigure.new [ 0, 1, 1 ]
    end
  end

  def test_new_raises_argument_error_when_data_has_non_array_elements
    assert_raises ArgumentError do
      TetrisFigure.new [ [0, 1], 1, [1] ]
    end
  end

  def test_new_raises_argument_error_when_data_has_subarrays_of_different_length
    assert_raises ArgumentError do
      TetrisFigure.new [ [0, 1], [1], [1] ]
    end
  end

  def test_to_a_returns_correct_data
    figure = TetrisFigure.new [[ 0, 1, 1 ]]
    assert_equal [[ 0, 1, 1 ]], figure.to_a

    figure = TetrisFigure.new [
      [ 0, 1, 1 ],
      [ 1, 1, 0 ],
    ]
    assert_equal [
      [ 0, 1, 1 ],
      [ 1, 1, 0 ],
    ], figure.to_a
  end

  def test_rotation_one_level_array
    figure = TetrisFigure.new [[ 0, 1, 1 ]]
    figure.rotate

    assert_equal [
      [0],
      [1],
      [1],
    ], figure.to_a
  end

  def test_rotation_multiple_level_array
    figure = TetrisFigure.new [
      [ 1, 0, 0 ],
      [ 1, 1, 1 ]
    ]

    figure.rotate
    assert_equal [
      [1,1],
      [1,0],
      [1,0],
    ], figure.to_a

    figure.rotate
    assert_equal [
      [1,1,1],
      [0,0,1],
    ], figure.to_a
  end
end
