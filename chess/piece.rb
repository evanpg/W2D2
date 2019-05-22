require 'singleton'
require_relative 'slidable.rb'
require_relative 'stepable.rb'

class Piece
  attr_accessor :pos
  def initialize(pos, board, color)
    @color = color
    @pos = pos
    @board = board
  end  

  def inspect
    "<>"
  end

  def to_s
    "<>".colorize(@color)
  end
end


class NullPiece < Piece
  include Singleton 

  attr_reader :color, :symbol
  def initialize()
    @color = :red
  end

  def to_s
    "##".colorize(@color)
  end

end

class Knight < Piece
  include Stepable
  def move_diffs
    @moves = [[2,1], [2,-1], [1,2], [-1,2],
             [-2,1], [-2,-1], [1,-2], [-1,-2]]
  end

  def to_s
    "N ".colorize(@color)
  end


end

class King < Piece
  include Stepable
  def move_diffs
    @moves = [[0,1], [0,-1], [1,0], [-1,0],
             [1,1], [-1,-1], [1,-1], [-1,1]]
  end


  def to_s
    "K ".colorize(@color)
  end


end

class Bishop < Piece
  include Slidable

  def to_s
    "B ".colorize(@color)
  end

end

class Rook < Piece
  include Slidable

  def to_s
    "R ".colorize(@color)
  end

end

class Queen < Piece
  include Slidable

  def to_s
    "Q ".colorize(@color)
  end

end

class Pawn < Piece
  include Stepable

  def move_diffs
    if @color == :yellow
      @moves = [[-1,0]]
    else
      @moves = [[1,0]]
    end
  end

  def to_s
    "P ".colorize(@color)


  end


end


