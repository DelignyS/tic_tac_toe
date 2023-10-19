# Requiert le fichier "grid.rb" pour utiliser la classe "Grid".
require 'grid'

# Requiert le fichier "player.rb" pour utiliser la classe "Player".
require 'player'

# Définition de la classe "Control" pour gérer le déroulement du jeu Tic-Tac-Toe.
class Control
  # Attributs pour stocker les joueurs, les cases vérifiées et le plateau de jeu.
  attr_accessor :player0, :player1, :checked_cases, :grid

  # Constructeur de la classe "Control". Initialise le plateau et la liste des cases vérifiées.
  def initialize
    # Crée un nouveau plateau de jeu (objet Grid) et une liste vide pour les cases vérifiées.
    @grid = Grid.new
    @checked_cases = []
  end

  # Méthode pour demander les noms des joueurs et initialiser leurs jetons.
  def ask_name
    puts "Quel est ton Blaze Premier joueur ?"
    print "> "
    name_player0 = gets.chomp
    toks = "X"
    player0 = Player.new(name_player0, toks)
    @player0 = player0
    puts " #{player0.name} tu as les #{player0.token} "
    puts " "
    puts "Quel est le Blaze deuxième joueur ?"
    print "> "
    name_player1 = gets.chomp
    toks = "O"
    player1 = Player.new(name_player1, toks)
    @player1 = player1
    puts "Quand à toi #{player1.name} tu as les #{player1.token} "
  end

  # Méthode pour créer un nouveau jeu en remettant le plateau à zéro.
  def create_game
    empty_game
    puts "C'EST PARTI pour cette partie de folie !"
    # Affiche le plateau de jeu vide.
    @grid.loading_board(@grid.square)
  end

  # Méthode pour vérifier si le plateau est plein.
  def isfull?
    if @checked_cases.length == 9
      return true
    else
      return false
    end
  end

  # Méthode pour vérifier si une case n'a pas déjà été jouée.
  def not_played?(value)
    if @checked_cases.include?(value)
      puts "Nope, déjà prise."
      return false
    else
      return true
    end
  end

  # Méthode pour vérifier si une case est valide sur le plateau.
  def case_checking?(value)
    possible = ["A0", "A1", "A2", "B0", "B1", "B2", "C0", "C1", "C2"]
    if possible.include?(value)
      return true
    else
      # Affiche un message d'erreur si la case n'est pas valide.
      puts "Nope, tu es hors de la grille, prends donc : (A0, A1, A2, B0, B1, B2, C0, C1 ou C2)"
      return false
    end
  end

  # Méthode pour réinitialiser le jeu en remettant le plateau à zéro et en vidant la liste des cases vérifiées.
  def empty_game
    # Remet le plateau à zéro en le remplissant avec des cases vides.
    @grid.square = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    # Vide la liste des cases vérifiées.
    @checked_cases = []
  end

  # Méthode principale pour gérer le déroulement du jeu.
  def game
    # Variable "state" pour suivre le tour actuel (0 pour le premier joueur, 1 pour le deuxième).
    state = 0

    while true
      if state == 0
        puts "A #{@player0.name} de mettre son '#{@player0.token}' sur la table"
        puts "Où veux tu jouer, #{@player0.name} ?"
        print "> "
        # Demande au joueur de saisir la case où il souhaite placer son pion.
        n = gets.chomp.upcase

        until not_played?(n) && case_checking?(n)
          # Tant que la case est déjà jouée ou invalide, continue de demander une nouvelle saisie.
          print "> "
          n = gets.chomp.upcase
        end

        # Ajoute la case vérifiée à la liste.
        @checked_cases << n
        # Fait jouer le premier joueur sur le plateau.
        @grid.play("player0", n)

        if @grid.iswin?(@player0.token)
          puts "#{@player0.name} a gagné."
          puts "CONGRATULATIONS (ça veut dire 'Champagne!' en anglais) #{@player0.name}! "
          puts " "
          @player0.score += 1
          # Termine la boucle si le premier joueur a gagné.
          break
        elsif isfull?
          puts "MATCH is NILL (petite référence à Ruby t'as vue) ! "
          puts " "
          # Termine la boucle si le plateau est plein sans gagnant.
          break
        else
          # Passe au tour du deuxième joueur.
          state = 1 - state
        end
      else
        puts "A #{@player1.name} de mettre son '#{@player1.token}' sur la table"
        puts "Quelle case veux tu cocher #{@player1.name} ?"
        print "> "
        # Demande au deuxième joueur de saisir la case où il souhaite placer son pion.

        n = gets.chomp.upcase

        until not_played?(n) && case_checking?(n)
          # Tant que la case est déjà jouée ou invalide, continue de demander une nouvelle saisie.
          print "> "
          n = gets.chomp.upcase
        end

        # Ajoute la case vérifiée à la liste.
        @checked_cases << n
        # Fait jouer le deuxième joueur sur le plateau.
        @grid.play("player1", n)

        if @grid.iswin?(@player1.token)
          puts "#{@player1.name} est le gagnant (Youpi)."
          puts "FÉLICITATIONS, #{@player1.name}! "
          puts " "
          @player1.score += 1
          # Termine la boucle si le deuxième joueur a gagné.
          break
        elsif isfull?
          puts "MATCH is NILL ! "
          puts " "
          # Termine la boucle si le plateau est plein sans gagnant.
          break
        else
          # Passe au tour du premier joueur.
          state = 1 - state
        end
      end
    end
  end
end
