require 'player'
# Définition de la classe "Grid" pour représenter le plateau du jeu Tic-Tac-Toe.
class Grid
  # Attribut qui stocke l'état du plateau (grille).
  attr_accessor :square
  # Constructeur de la classe "Grid". Il initialise le plateau avec des cases vides.
  def initialize
    @square = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
  end
  # Méthode pour afficher le plateau vide.
  def empty_board
    loading_board(@square)
  end
  # Méthode pour afficher le plateau actuel avec les pions des joueurs.
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
  # Méthode pour placer le pion d'un joueur sur le plateau.
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
    # Place le pion du joueur (X ou O) à la position spécifiée sur le plateau.
    @square[i][position[1].to_i] = l
    return loading_board(@square) # Affiche le plateau mis à jour.
  end
  # Méthode pour vérifier si un joueur a gagné en comparant les cases du plateau.
  def iswin?(token)
    if (@square[0][0] == @square[0][1] && @square[0][1] == @square[0][2] && @square[0][0] == token) || #[0][0], [0][1], [0][2] 1hori
       (@square[1][0] == @square[1][1] && @square[1][1] == @square[1][2] && @square[1][0] == token) || #[1][0], [1][1], [1][2] 2hori
       (@square[2][0] == @square[2][1] && @square[2][1] == @square[2][2] && @square[2][0] == token) || #[2][0], [2][1], [2][2] 3hori
       (@square[0][0] == @square[1][0] && @square[1][0] == @square[2][0] && @square[0][0] == token) || #[0][0], [1][0], [2][0] 1verti
       (@square[0][1] == @square[1][1] && @square[1][1] == @square[2][1] && @square[0][1] == token) || #[0][1], [1][1], [2][1] 2verti
       (@square[0][2] == @square[1][2] && @square[1][2] == @square[2][2] && @square[0][2] == token) || #[0][2], [1][2], [2][2] 3verti
       (@square[0][0] == @square[1][1] && @square[1][1] == @square[2][2] && @square[0][0] == token) || #[0][0], [1][1], [2][2] 1diago
       (@square[0][2] == @square[1][1] && @square[1][1] == @square[2][0] && @square[0][2] == token)    #[0][2], [1][1], [2][0] 2diago
      return true
    else
      return false
    end
  end
end