module Slidable

  HORIZONTAL_DIRS = [[1,1], [-1,-1], [1,-1], [-1,1]]
  DIAGONAL_DIRS = [[0,1], [0,-1], [1,0], [-1,0]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves()
    grow_unblocked_moves_in_dir(diagonal_dirs, horizontal_dirs)
  end

  private 
  def move_dirs 
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end

end

