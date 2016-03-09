#!/usr/bin/env ruby
require_relative 'lib/terminal'
require_relative 'lib/output'
require_relative 'app/tetris'

terminal = Terminal.new
tetris = Tetris.new
output = Output.new
terminal.draw output.field_and_figure tetris.game_field, tetris.new_figure

loop do
  terminal.draw output.field_and_figure tetris.game_field, tetris.new_figure

  if terminal.get_input == '['
    case terminal.get_input
    when ?D
      terminal.movecursor :left
    when ?A
      terminal.movecursor :up
    when ?C
      terminal.movecursor :right
    when ?B
      terminal.movecursor :down
    end
  end

  if (terminal.current_input.getbyte(0) == 3)
    exit 1
  end
end
