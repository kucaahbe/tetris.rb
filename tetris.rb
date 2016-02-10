#!/usr/bin/env ruby
require 'io/console'
require_relative 'lib/terminal'
require_relative 'app/tetris'

# draw game field
terminal = Terminal.new true
terminal.placecursor 3, 3
terminal.draw [
  [1,1,1,1,1,1,1,1,],
  [1,1,1,1,1,1,1,1,],
  [1,0,1,1,1,1,1,1,],
  [1,0,0,1,1,1,1,1,],
  [1,0,0,0,1,1,1,1,],
  [1,0,0,0,1,1,1,1,]
]

loop do
  terminal.draw 10.times.map {
    20.times.map { rand 2 }
  }

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
