# Définition d'une classe appelée "Player" pour représenter un joueur dans le jeu.
class Player
  # Création d'attributs (variables spéciales) pour stocker le nom, le jeton (X ou O), et le score du joueur.
  attr_accessor :name, :token, :score

  # Le constructeur de la classe Player. Il est appelé lorsque nous créons un nouveau joueur.
  def initialize(name, token)
    # Initialisation de l'attribut "name" avec le nom du joueur passé en argument.
    @name = name
    # Initialisation de l'attribut "token" avec le jeton (X ou O) passé en argument.
    @token = token
    # Initialisation de l'attribut "score" à 0 (le score commence à zéro pour chaque joueur).
    @score = 0
  end
end