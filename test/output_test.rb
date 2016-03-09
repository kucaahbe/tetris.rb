require 'minitest/autorun'
require_relative '../lib/output'

class TestOutput < Minitest::Test
  def test_field_and_figure
    output = Output.new
    field = [
      [1,1,1],
      [1,2,1],
      [1,1,1],
    ]
    figure = [
      [0,1,0],
      [1,1,0],
    ]

    assert_equal [
      [1,1,1, 0, 0,1,0],
      [1,2,1, 0, 1,1,0],
      [1,1,1, 0, 0,0,0],
    ], output.field_and_figure(field,figure)
  end
end
