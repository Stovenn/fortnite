class Game
  attr_accessor :human_player, :foes

  def initialize(human_player)
    @human_player = HumanPlayer.new("#{human_player}")
    @foes = []
       @foes <<  Player.new("foe 1")
       @foes <<  Player.new("foe 2")
       @foes <<  Player.new("foe 3")
       @foes <<  Player.new("foe 4")
  end

  def kill_player(player)
    @foes.delete_if{|foe| foe.name = player.name}
  end

  def is_still_on_going?
    if @human_player.life_points > 0 && !@foes.empty?
      return true
    else
      return false
    end
  end

  def show_players
    human_player.show_state
    puts "Il reste #{@foes.length} ennemis a abattre."
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "\n"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner" 
    puts "\n"
    puts "attaquer un joueur en vue :"
    puts "0 - #{foes[0].name} a #{foes[0].life_points} points de vie"
    puts "1 - #{foes[1].name} a #{foes[1].life_points} points de vie"
    puts "2 - #{foes[2].name} a #{foes[2].life_points} points de vie"
    puts "3 - #{foes[3].name} a #{foes[3].life_points} points de vie"
    puts "\n"
   end

   def menu_choice(choice)
    case choice
    when "a"
      puts @human_player.search_weapon
    when "s"
      puts @human_player.search_health_pack
    when "0"
      if @foes[0].life_points > 0 
        puts @human_player.attacks(@foes[0])
      else
        kill_player(@foes[0])
      end
    when "1"
      if @foes[0].life_points > 0 
        puts @human_player.attacks(@foes[0])
      else
        kill_player(@foes[1])
      end
    when "2"
      if @foes[0].life_points > 0 
        puts @human_player.attacks(@foes[0])
      else
        kill_player(@foes[2])
      end
    when "3"
      if @foes[0].life_points > 0 
        puts @human_player.attacks(@foes[0])
      else
        kill_player(@foes[3])
      end
    else
      puts "Veuillez choisir une action presente dans la liste !"
      choice = gets.chomp
    end
    puts "\n"
  end

   def enemies_attack
    puts "Les ennemis passent a l'attaque !"
    puts "\n"
    @foes.each{|foe| foe.attacks(@human_player) if foe.life_points > 0} 
   end

   def end
    if @human_player.life_points > 0 && @foes.length == 0
    puts "Felicitations, vous avez fini le jeu !"
    elsif @human_player.life_points == 0 
    puts "Game Over"
   end
  end
end