
class Game

  @@value = 0

  def initialize(player)
    @player = player
    @code = []
    make_code
    create_board
    make_hint
  end

  def make_code
    colors = ["R","G","B","Y","W","O"]
    colors.shuffle!
    4.times do
      val = colors.pop
      @code.push(val)
    end
    return @code
  end

  def create_board
    @board_array = 
    [
      [" "," "," "," "],
      [" "," "," "," "],
      [" "," "," "," "],
      [" "," "," "," "],
      [" "," "," "," "],
      [" "," "," "," "],
      [" "," "," "," "],
      [" "," "," "," "],
      [" "," "," "," "]
    ]
  end

  def make_hint
    @hint = 
    [
      [" "," "," "," "],
      [" "," "," "," "],
      [" "," "," "," "],
      [" "," "," "," "],
      [" "," "," "," "],
      [" "," "," "," "],
      [" "," "," "," "],
      [" "," "," "," "]
    ]
  end

  def show_board
    
    puts "#{@board_array[0]} Guess:1 #{@hint[0]}"
    puts "#{@board_array[1]} Guess:2 #{@hint[1]}"
    puts "#{@board_array[2]} Guess:3 #{@hint[2]}"
    puts "#{@board_array[3]} Guess:4 #{@hint[3]}"
    puts "#{@board_array[4]} Guess:5 #{@hint[4]}"
    puts "#{@board_array[5]} Guess:6 #{@hint[5]}"
    puts "#{@board_array[6]} Guess:7 #{@hint[6]}"
    puts "#{@board_array[7]} Guess:8 #{@hint[7]}"
    
    puts ""
    #puts "#{@board_array[8]} Code"

  end

  def make_guess
    puts "Enter R,G,B,Y,W,O #{@player.name} in the order of your choice"
    guess = gets.chomp.upcase.split("")
    @board_array[@@value] = guess
    @@value += 1
  end

  def winner
    num = 0
    if @board_array[@@value-1] == @code
      return 1
    end
    @board_array[@@value-1].map do |value|
        if @code[num] == value
           @hint[@@value-1][num] = "X"
        elsif @code.include?(value)
          @hint[@@value-1][num] = "O"
        end
        num += 1
    end
    return 0
  end

  def game_loop
    loser = 0
    show_board
    8.times do
      make_guess
      winner
      if winner != 0
        puts "Winner code is was: #{@code}"
        loser += 1
        break
      end
      show_board
    end
      if loser == 0
        puts "Game over code was: #{@code}"
      end
  end


end

#class Player
#
#  attr_reader :name
#
#  def initialize(name)
#    @name = name
#  end
#end

#puts "Enter you name:"
#p = gets.chomp
#player = Player.new(p)
#
#g = Game.new(player)
#g.game_loop
