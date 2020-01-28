require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts "Veuillez saisir votre prenom ?"
print " >"

my_game = Game.new(gets.chomp)

while my_game.is_still_on_going?
  my_game.show_players
  my_game.menu
  my_game.menu_choice(gets.chomp)
  my_game.enemies_attack
end 

puts my_game.end



# binding.pry