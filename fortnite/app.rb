require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player_1 = Player.new("jojo")
player_2 = Player.new("dio")

while player_1.life_points > 0 && player_2.life_points > 0
  puts "Voici l'etat de chaque joueur :"
  player_1.show_state
  player_2.show_state
  puts "\n"
  puts "Passons a la phase d'attaque :"
  if player_1.life_points <= 0
    break
  else
    player_1.attacks(player_2)
  end
  if player_2.life_points <= 0
    break
  else 
    player_2.attacks(player_1)
  end
  puts "\n"
end

# binding.pry
