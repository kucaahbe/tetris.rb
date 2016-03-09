require 'minitest/autorun'
require_relative '../app/tetris'

class TestTetris < Minitest::Test
  def test_game_field
    tetris = Tetris.new 4, 3
    assert_equal [
      [1,1,1,1,1,1],
      [1,0,0,0,0,1],
      [1,0,0,0,0,1],
      [1,0,0,0,0,1],
      [1,1,1,1,1,1],
    ], tetris.game_field

    tetris = Tetris.new 4, 4
    assert_equal [
      [1,1,1,1,1,1],
      [1,0,0,0,0,1],
      [1,0,0,0,0,1],
      [1,0,0,0,0,1],
      [1,0,0,0,0,1],
      [1,1,1,1,1,1],
    ], tetris.game_field
  end

  def test_new_figure
    tetris = Tetris.new
    # T unroated
    with_srand 1 do
      assert_equal [
        [0, 1, 0],
        [1, 1, 1]
      ], tetris.new_figure
    end

    # I roated once
    with_srand 2 do
      assert_equal [
        [1],
        [1],
        [1],
        [1]
      ], tetris.new_figure
    end

    # L unrotated
    with_srand 3 do
      assert_equal [
        [0, 0, 1],
        [1, 1, 1]
      ], tetris.new_figure
    end

    # 0 rotated 3 times
    with_srand 5 do
      assert_equal [
        [1, 1],
        [1, 1]
      ], tetris.new_figure
    end
  end

  private

  def with_srand srand_value
    old_srand = srand
    srand srand_value
    yield
    srand old_srand
  end
end
