require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "           ———————————————————————————————————————————————"
puts "          |          Bienvenue sur 'FORTONIGHT' !         |"
puts "          |Le but du jeu est d'être le dernier survivant !|"
puts "           _______________________________________________"
puts " "

puts "Entre ton pseudo ou ton prénom :"
print ">"

user = gets.chomp

puts " "
puts "Salut jeune joueur, ton but est de tuer Josiane et José, bonne chance."
puts " "

user = Humanplayer.new(user)
player1 = Player.new("José")
player2 = Player.new("Josiane")

enemies = []
enemies << player1 << player2

  while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0) do
    
    puts "Voici tes statistiques :"
    user.show_state
    puts " "

    puts "Que veux-tu faire ?"
    puts " "

    puts " a - chercher une meilleure arme"
    puts " s - chercher à se soigner"
    puts " "

    puts "Attaquer un joueur en vue :"
    puts " "
    puts "0 - #{player1.name} a #{player1.life_points} points de vie." if player1.life_points > 0
    puts "1 - #{player2.name} a #{player2.life_points} points de vie." if player2.life_points > 0 
    puts " "

    puts "Entre ton choix ci-dessous :"
    print ">"
    input = gets.chomp
    puts " "
    
    if input == "a"
      user.search_weapon
    elsif input == "s"
      user.search_health_pack
    elsif input == "0"
      user.attacks(player1)
    elsif input == "1"
      user.attacks(player2)
    end


    puts " "
    break if player1.life_points <= 0 && player2.life_points <= 0 
    puts "Attention ! L'enemie attaque !"
    puts " "
    enemies.each do |player|
      if player.life_points > 0
        player.attacks(user)
    end
  end

end

  puts " "
  puts "                     == Partie terminée ==             "
  puts " "

  if player1.life_points <= 0 && player2.life_points <= 0
  puts "           —————————————————————————————————————————"
  puts "          |          BRAVO ! TU ES TOP 1 !!         |"
  puts "           _________________________________________"
  elsif user.life_points <= 0
    puts " Dommage, tu es mort ! RIP "
  end




