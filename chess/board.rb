require_relative "piece.rb"
require "byebug"
class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8)}
    self.set_pieces
  end
  
  def set_pieces

    # @grid[0][0] = Rook.new([0,0],self,:yellow)
    # @grid[0][1] = Knight.new([0,1],self,:yellow)

    @grid.each_with_index do |row,i|
      row.each_with_index do |col, j|
        if i == 0
          @grid[i][j] = Piece.new([i,j],self,:yellow)
        elsif i == 1
          @grid[i][j] = Pawn.new([i,j],self,:yellow)
        elsif i == 6 
          @grid[i][j] = Pawn.new([i,j],self,:blue)
        elsif i == 7
          @grid[i][j] = Piece.new([i,j],self,:blue)
        else
          null = NullPiece.instance()
          @grid[i][j] = null
        end
      end
    end
  end

  def print_board
    @grid.each_with_index do |row, i|
      row.each_with_index do |col, j|
          print self[[i,j]]
      end
      puts
    end
   
  end

  def move_piece(start_pos, end_pos)
    
    if !self[start_pos].is_a?(Piece)
      raise "invalid start position!"
    elsif start_pos[0] < 0 || start_pos[1] < 0 || start_pos[0] > 7 || start_pos[1] > 7
      raise "invalid start position!"
    elsif end_pos[0] < 0 || end_pos[1] < 0 || end_pos[0] > 7 || end_pos[1] > 7 
      raise "invalid end position!"
    end
   # @grid[end_pos[0]][end_pos[1]] = self[start_pos]
   self[end_pos] = self[start_pos]
   self[start_pos] = nil
  end
  
  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def valid_pos?(pos)
    if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
      raise "invalid position"
    end
    true
  end
end

# b = Board.new
# sp = [1,1]
# ep = [2,2]

# b.move_piece(sp,ep)
