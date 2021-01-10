class Player
  attr_accessor :name, :life_points

  def initialize(name, life_points = 10)
    @name = name
    @life_points = life_points
  end

  def show_state
    puts "#{name} a #{life_points} points de vie"
  end

  def gets_damage(damage)
    gets_chomp = damage
    @life_points = @life_points - damage
    if @life_points <= 0
      puts "Le joueur #{name} a été tué ! Bien joué !"
    end
  end

  def attacks(player, damage=compute_damage)
    puts "Le joueur #{@name} attaque le joueur #{player.name} "
    puts " "
    
    puts "Et lui inflige #{compute_damage} points de dommages"
    puts " "
    damage = player.gets_damage(compute_damage)
  end

  def compute_damage
    return rand(1..6)
  end
end

  class Humanplayer < Player
    attr_accessor :weapon_level

    def initialize(name, life_points = 100)
      @weapon_level = 1
      super
    end

    def show_state
      puts "#{name} a #{life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
      rand(1..6) * @weapon_level
    end

    def search_weapon
      new_weapon = rand(1..6)
      puts "Tu as trouvé une arme de niveau #{new_weapon}"
      puts " "
      if new_weapon > weapon_level
        weapon_level = new_weapon
        puts " Très belle arme, prends la tout de suite !"
        puts " "
      else
        puts "Trop nulle cette arme, laisses la par-terre."
        puts " "
      end
    end

    def search_health_pack
      health_pack = rand(1..6)

      if health_pack == 1
        puts "Dommage, tu n'as rien trouvé..."

      elsif health_pack >= 2 && health_pack <= 5
        50.times { @life_points += 1 if @life_points < 100 } 
        puts "Super, tu es soigné de 50 points de vie !"

      else health_pack == 6
        80.times { @life_points += 1 if @life_points < 100 }
        puts "Daaamn, tu es soigné de 80 points de vie !!"
      end
    end
  end


