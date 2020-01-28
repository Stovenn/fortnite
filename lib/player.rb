require 'pry'

class Player
attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points -= damage 

    if @life_points < 0 
      @life_points = 0
      puts "le joueur #{@name} a été tué !"
    end
  end

  def attacks(player)
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    dmg = compute_damage
    puts "il lui inflige #{dmg} points de dommages"
    player.gets_damage(dmg)
  end

  def compute_damage
    return rand(1..6)
  end
end


class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @life_points = 100
    @name = name
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouve une arme de niveau #{new_weapon}."

    if @weapon_level < new_weapon
      @weapon_level = new_weapon
      puts "Cette arme est plus puissante que celle en ta possession, tu decides de la prendre"
      puts "\n"
    else
      puts "Cette arme est moins puissante que celle en ta possession, dommage..."
      puts "\n"
    end
  end

  def search_health_pack
    result = rand(1..6)
    case result
    when 1
      puts "Tu n'a rien trouve, dommage..."
      puts "\n"
    when 2..5
      puts "Bravo, tu as trouve un pack de +50 points de vie !"
      puts "\n"
      @life_points += 50
      if @life_points > 100
        @life_points = 100
      end
    when 6 
      puts "Waow, tu as trouve un pack de +80 points de vie !"
      puts "\n"
      @life_points += 80
      if @life_points > 100
        @life_points = 100
      end
    end
  end
end