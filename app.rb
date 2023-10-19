# Configuration pour permettre au programme de trouver les fichiers dans le dossier "lib".
$:.unshift File.expand_path("./../lib", __FILE__)
require 'hub'
require 'pry'
# Crée une nouvelle instance de la classe "Hub" (qui se trouve dans "hub.rb" dans le dossier "lib").
# Puis, appelle la méthode "entry" de cette instance pour lancer le programme.
Hub.new.entry
#binding.pry