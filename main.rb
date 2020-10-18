require_relative "player"
require_relative "mastermind"


puts "Enter you name:"
p = gets.chomp
player = Player.new(p)

g = Game.new(player)
g.game_loop