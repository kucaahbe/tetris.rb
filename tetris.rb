#!/usr/bin/env ruby
require 'io/console'

class Terminal

  CURSOR_MOVEMENT = {
    up:    'A',
    down:  'B',
    right: 'C',
    left:  'D',
  }

  def movecursor direction, count=1
    code = CURSOR_MOVEMENT[direction]
    fail "unknown cursor direction #{direction}, valid directions: #{CURSOR_MOVEMENT.keys}" unless code

    print "\e[#{count}#{code}"
  end
end

current_char = ''
def get_input
  current_char = STDIN.getch
end

terminal = Terminal.new

loop do
  if get_input == '['
    case get_input
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
end
