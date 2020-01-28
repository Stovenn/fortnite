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
f_name =  gets.chomp
foes = []

player_1 = HumanPlayer.new(f_name)
foes << foe_1 = Player.new("Jose")
foes << foe_2 = Player.new("Josiane")

while player_1.life_points > 0 && (foe_1.life_points > 0 || foe_2.life_points > 0)
  puts "Voici l'etat de chaque joueur :"
  player_1.show_state
  foe_1.show_state
  foe_2.show_state
  puts "\n"

  puts "Quelle action veux-tu effectuer ?"
  puts "\n"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner" 
  puts "\n"
  puts "attaquer un joueur en vue :"
  puts "0 - #{foe_1.name} a #{foe_1.life_points} points de vie"
  puts "1 - #{foe_2.name} a #{foe_2.life_points} points de vie"
  puts "\n"

  choice = gets.chomp

  case choice
  when "a"
    puts player_1.search_weapon
  when "s"
    puts player_1.search_health_pack
  when "0"
    puts player_1.attacks(foe_1)
  when "1"
    puts player_1.attacks(foe_2)
  else
    puts "Veuillez choisir une action presente dans la liste !"
    choice = gets.chomp
  end
  puts "\n"


  puts "Les autres joueurs t'attaquent !"
  puts "\n"
  foes.each{|foe| foe.attacks(player_1) if foe.life_points > 0} 
end

puts "Felicitations, vous avez fini le jeu !"

# binding.pry
