require_relative 'tetris_figure'

class Tetris
  I = [
    [1,1,1,1]
  ]
  J = [
    [1,0,0,0],
    [1,1,1,1]
  ]
  L = [
    [0,0,1],
    [1,1,1]
  ]
  O = [
    [1,1],
    [1,1]
  ]
  S = [
    [0,1,1],
    [1,1,0]
  ]
  T = [
    [0,1,0],
    [1,1,1],
  ]
  Z = [
    [1,1,0],
    [0,1,1]
  ]

  def initialize width=10, height=20
    @width = width
    @height = height
  end

  def game_field
    top_line = Array.new(@width+2, 1)
    middle_line = [1] + Array.new(@width,0) + [1]

    [
      top_line,
      *Array.new(@height,middle_line),
      top_line.dup
    ]
  end

  def new_figure
    figure = TetrisFigure.new [I,J,L,O,S,T,Z].sample
    position = rand(3)
    position.times { figure.rotate }
    figure.to_a
  end
end
