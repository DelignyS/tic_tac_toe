require 'grid'
require 'player'

class Control
  attr_accessor :player0, :player1, :checked_cases, :grid

  def initialize
    @grid = Grid.new
    @checked_cases = []
  end

  def ask_name
    puts "Quel est le nom du premier joueur ?"
    print "> "
    name_player0 = gets.chomp
    toks = "X"
    player0 = Player.new(name_player0, toks)
    @player0 = player0
    puts " #{player0.name} tu as les #{player0.token} "
    puts " "
    puts "Quel est le nom du deuxième joueur ?"
    print "> "
    name_player1 = gets.chomp
    toks = "O"
    player1 = Player.new(name_player1, toks)
    @player1 = player1
    puts "Quand à toi #{player1.name} tu as les #{player1.token} "
  end

  def create_game
    empty_game
    puts "C'EST PARTI !"
    @grid.loading_board(@grid.square)
  end

  def isfull?
    if @checked_cases.length == 9
      return true
    else
      return false
    end
  end

  def not_played?(value)
    if @checked_cases.include?(value)
      puts "Nope, déjà prise."
      return false
    else
      return true
    end
  end

  def case_checking?(value)
    possible = ["A0", "A1", "A2", "B0", "B1", "B2", "C0", "C1", "C2"]
    if possible.include?(value)
      return true
    else
      puts "Nope, tu es hors de la carte, l'une des cases suivantes est valide (A0, A1, A2, B0, B1, B2, C0, C1 ou C2)"
      return false
    end
  end

  def empty_game
    @grid.square = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    @checked_cases = []
  end

  def game
    state = 0

    while true
      if state == 0
        puts "A #{@player0.name} de mettre son '#{@player0.token}' sur la table"
        puts "Où veux tu jouer, #{@player0.name} ?"
        print "> "
        n = gets.chomp.upcase

        until not_played?(n) && case_checking?(n)
          print "> "
          n = gets.chomp.upcase
        end

        @checked_cases << n
        @grid.play("player0", n)

        if @grid.iswin?(@player0.token)
          puts "#{@player0.name} a gagné."
          puts "CONGRATULATIONS (ça veut dire 'Champagne!' en anglais) #{@player0.name}! "
          puts " "
          @player0.score += 1
          break
        elsif isfull?
          puts "MATCH NUL ! "
          puts " "
          break
        else
          state = 1 - state
        end
      else
        puts "A #{@player1.name} de mettre son '#{@player1.token}' sur la table"
        puts "Quelle case veux tu cocher #{@player1.name} ?"
        print "> "
        n = gets.chomp.upcase

        until not_played?(n) && case_checking?(n)
          print "> "
          n = gets.chomp.upcase
        end

        @checked_cases << n
        @grid.play("player1", n)

        if @grid.iswin?(@player1.token)
          puts "#{@player1.name} est le gagnant (Youpi)."
          puts "FÉLICITATIONS, #{@player1.name}! "
          puts " "
          @player1.score += 1
          break
        elsif isfull?
          puts "MATCH is NILL ! "
          puts " "
          break
        else
          state = 1 - state
        end
      end
    end
  end
end
