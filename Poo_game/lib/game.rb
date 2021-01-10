class Game
  attr_accessor :HumanPlayer, :enemies

    def initialize(user_name)
      @human_player = Humanplayer
      @enemies = []
      player1 = Player.new("Uno")
      player2 = Player.new("Dos")
      player3 = Player.new("Tres")
      player4 = Player.new("cuatro")
      @enemies << player1 << player2 << player3 << player4
    end
end