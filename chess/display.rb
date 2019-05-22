require "colorize"
require_relative "cursor.rb"
require_relative "board.rb"
require "byebug"

class Display
  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], @board)

  end

  def render
    @board.grid.each_with_index do |row,i|
      row.each_with_index do |col, j|
        if [i,j] == @cursor.cursor_pos
          print @board[[i,j]].to_s.colorize(:green)
        else
          print @board[[i,j]]
        end
      end
    puts
    end

  end

  def play
    while true
      system("clear")
      render
      @cursor.get_input
      puts
      puts
    end
  end

end

d = Display.new
d.play