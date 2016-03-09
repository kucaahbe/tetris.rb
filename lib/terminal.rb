require 'io/console'

class Terminal
  CURSOR_MOVEMENT = {
    up:    'A',
    down:  'B',
    right: 'C',
    left:  'D',
  }

  def initialize debug=false
    @debug = debug
  end

  def placecursor x, y
    send_ansi_cs "#{x};#{y}f"
  end

  def movecursor direction, count=1
    code = CURSOR_MOVEMENT[direction]
    fail "unknown cursor direction #{direction}, valid directions: #{CURSOR_MOVEMENT.keys}" unless code

    send_ansi_cs "#{count}#{code}"
  end

  def draw data, start_x=0, start_y=0
    erase_display

    cursor_in_place do
      placecursor start_x, start_y
      data.each do |horizontal|
        horizontal.each { |point| print_point point }
        puts
      end
    end
  end

  def erase_display
    send_ansi_cs '2J'
  end

  def get_input
    @current_char = STDIN.getch
    write_to_log do |log|
      log.puts @current_char.inspect
      log.puts @current_char.getbyte(0).inspect
    end
    @current_char
  end

  def current_input
    @current_char
  end

  private

  DRAW_MAP = {
    0 => ' ',
    1 => '*'
  }

  def print_point point
    drawable = DRAW_MAP[point]
    if drawable
      print drawable
    else
      fail "unknown point #{point}"
    end
  end

  def cursor_in_place &block
    send_ansi_cs 's'
    block.call
    send_ansi_cs 'u'
  end

  def send_ansi_cs cs
    print "\e[#{cs}"
  end

  def write_to_log &block
    if @debug
      File.open('terminal.log', 'w+') do |log|
        block.call log
      end
    end
  end
end
