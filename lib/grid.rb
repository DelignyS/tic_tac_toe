require 'player'

class Grid
  attr_accessor :square
  @square = [[" "," " ," "] , [" "," "," "] , [" ", " "," "]]

#Empty one
  def empty_board
    loading_board(@square)
  end
  #Puts it on visual
  def loading_board(arr)
     puts " "
    puts "       0     1     2  "
    puts "    ___________________                                 "
    puts "A   |  #{arr[0][0]}  |  #{arr[0][1]}  |  #{arr[0][2]}  |"
    puts "    |_____|_____|_____|                                 "
    puts "B   |  #{arr[1][0]}  |  #{arr[1][1]}  |  #{arr[1][2]}  |"
    puts "    |_____|_____|_____|                                 "
    puts "C   |  #{arr[2][0]}  |  #{arr[2][1]}  |  #{arr[2][2]}  |"
    puts "    |_____|_____|_____|                                 "
   puts " "
  end
  def play(player, position)
    position = position.upcase
    if player == "player0"
      l = "X"
    elsif player == "player1"
      l = "O"
    end
   if position[0] == "A"
      i = 0
    elsif position[0] == "B"
      i = 1
    elsif position[0] == "C"
      i = 2
    end
    @square[i][position[1].to_i] = l
    return loading_board(@square)
  end
  #Win Condition 
  def iswin?(token)
    if (@square[0][0] == @square[0][1] && @square[0][1] == @square[0][2] && @square[0][0] == token) || (@square[1][0] == @square[1][1] && @square[1][1] == @square[1][2] && @square[1][0] == token) || (@square[2][0] == @square[2][1] && @square[2][1] == @square[2][2] && @square[2][0] == token) || (@square[0][0] == @square[1][0] && @square[1][0] == @square[2][0] && @square[0][0] == token) || (@square[0][1] == @square[1][1] && @square[1][1] == @square[2][1] && @square[0][1] == token) || (@square[0][2] == @square[1][2] && @square[1][2] == @square[2][2] && @square[0][2] == token) || (@square[0][0] == @square[1][1] && @square[1][1] == @square[2][2] && @square[0][0] == token) || (@square[0][2] == @square[1][1] && @square[1][1] == @square[2][0] && @square[0][2] == token)
     return true
   else
      return false
    end
  end
end