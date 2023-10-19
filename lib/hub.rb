require 'control'

class Hub
  attr_accessor :control

  def initialize
    @control = Control.new
  end

  def entry
    puts " "
    puts "-------------------------------------------------"
    puts "|  C'EST L'HEURE DE MORPIONNER JUSQU'A LA MORT !|"
    puts "-------------------------------------------------"
    puts " "

    while true
      puts "Que veux-tu faire ?"
      puts "1. Commencer une partie"
      puts "2. Quitter le jeu"

      choices = gets.chomp.to_i

      case choices
      when 1
        start_game
      when 2
        goodbye
        break
      else
        puts "Veuillez choisir 1 ou 2. Essayez encore."
      end
    end
  end

  def start_game
    puts "C'est parti pour le fun !"
    @control.ask_name
    @control.create_game
    @control.game
  end

  def goodbye
    puts "ALORS, SALUT ! Merci d'avoir joué à ce jeu avec nous !"
  end
end