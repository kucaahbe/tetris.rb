class Tetris
  def initialize width=10, height=20
    @width = width
    @height = height
  end

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

  private

  def new_figure
    figure = [I,J,L,O,S,T,Z].sample
    position = rand(3)
  end
end
