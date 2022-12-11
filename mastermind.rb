require 'pry-byebug'
class Row
attr_accessor :single_row

  def initialize
  @single_row = 
  "   ⬛️  ⬛️  ⬛️  ⬛️  ⬛️     
  +---+---+---+---+---+"
  end

  def refresh_display(row) 
    puts row.single_row
  end

  def to_s
    puts @single_row
  end

  def print_row
    puts @single_row
  end
end

class Player
  attr_reader :colors, :input, :order, :block_num, :block_chars, :round

  def initialize
    @colors = {
      1 => "🟦",
      2 => "🟨",
      3 => "🟥",
      4 => "🟪",
      5 => "🟧",
      :arrow => "⬅",
      :noarrow => " ",
    }

    @block_chars = {
      1 => 3,
      2 => 7,
      3 => 11,
      4 => 15,
      5 => 19,
      :arrow => 23
    }

    @block_num  = 1
    @round = 0
  end

  def get_input
    @input = gets.chomp.to_i
  end

  def generate_order
    color_array = ["1", "2", "3", "4", "5"]
    @order = Array.new(5) { color_array.sample }
  end

  def block_num_incr 
    @block_num  += 1
  end

  def round_incr
    @round += 1
  end
end


class Game
attr_reader :rows

@@key = 
"                                    
Enter your guess: 1🟦 2🟨 3🟥 4🟪 5🟧"

  def initialize
    @rows = Array.new(0)
    @player = Player.new
    rows.push(row_1 = Row.new)
    rows.push(row_2 = Row.new)
    rows.push(row_3 = Row.new)
    rows.push(row_4 = Row.new)
    rows.push(row_5 = Row.new)
    rows.push(row_6 = Row.new)
    rows.push(row_7 = Row.new)
    rows.push(row_8 = Row.new)
    rows.push(row_9 = Row.new)
    rows.push(row_10 = Row.new)
    rows.push(row_11 = Row.new)
    rows.push(row_12 = Row.new)

    (1..12).each do
      oneRound(@player)
    end
  end

    def oneRound(player)
      rows.each do 
        |row|
        rows[player.round].single_row[(player.block_chars[:arrow])]=(player.colors[:arrow])
        row.refresh_display(row)
      end
      puts @@key 
      (1..5).each do |i|
        player.get_input 
        rows[player.round].single_row[(player.block_chars[i])]=(player.colors[player.input])
         puts "\e[2J"
        rows.each {|row| row.refresh_display(row)}
        puts @@key 
        if i === 5 
          rows[player.round].single_row[(player.block_chars[:arrow])]=(player.colors[:noarrow])
          player.round_incr
          if (player.round < 12); puts "\e[2J"; end
        end 
      end   
    end

  

  def generate_order
    color_array = ["1", "2", "3", "4", "5"]
    order = Array.new(5) { color_array.sample }
    end

end


Game.new


#don't show pegs until after all guesses made, then display pegs ⚫️ for wrong ⚪️ right color wrong space 🟢 right color right space
#make conscious effort to use CONSTANTS for things that aren't going to change, realized during this project that CONSTANTS are in scope for class methods. 

