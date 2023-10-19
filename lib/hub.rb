# Requiert le fichier "control.rb" pour utiliser la classe "Control".
require 'control'

# Définition de la classe "Hub" pour gérer le menu principal du jeu Tic-Tac-Toe.
class Hub
  # Attribut pour stocker une instance de la classe "Control".
  attr_accessor :control

  # Constructeur de la classe "Hub". Crée une instance de "Control" pour gérer le jeu.
  def initialize
    @control = Control.new
  end

  # Méthode pour lancer le menu principal du jeu.
  def entry
    puts " "
    puts "-------------------------------------------------"
    puts "|  C'EST L'HEURE DE MORPIONNER JUSQU'A LA MORT !|"
    puts "-------------------------------------------------"
    puts " "

    while true
      puts "Tu vas faire quoi ?"
      puts "1. New Game"
      puts "2. Exit"

      choices = gets.chomp.to_i

      case choices
      when 1
        # Démarre une nouvelle partie en appelant la méthode "start_game".
        start_game
      when 2
        # Quitte le jeu en appelant la méthode "goodbye" et termine la boucle.
        goodbye
        break
      else
        # Affiche un message d'erreur si l'entrée n'est ni 1 ni 2.
        puts "C'est 1 ou 2, rien de plus rien de moins. Si c'est trop compliqué je t'explique ici ce que j'attends de toi."
      end
    end
  end
# Méthode pour démarrer une nouvelle partie du jeu.
  def start_game
    puts "C'est parti pour le fun !"
    # Demande les noms des joueurs et initialise une nouvelle partie en appelant les méthodes de la classe "Control".
    @control.ask_name
    @control.create_game
    @control.game
  end
  # Méthode pour afficher un message de fin lorsque le joueur quitte le jeu.
  def goodbye
    puts "Vraiment, j'ai passé 2 jours à créer ce jeu !"
  end
end
