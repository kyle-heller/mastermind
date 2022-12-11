require 'pry-byebug'
class Row ##purpose to save state of row
attr_accessor :single_row, :guesses, :correct, :correctcolor, :wrong

  def initialize
    @single_row = 
    "   ⬛️  ⬛️  ⬛️  ⬛️  ⬛️            
  +---+---+---+---+---+"

    @guesses = Array.new(0)
    @correct = Array.new(0)
    @correctcolor = Array.new(0)
    @wrong = Array.new(0)

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



class Player ##purpose to interact with player/computer
  attr_reader :colors, :input, :order, :block_num, :block_chars, :round

  def initialize 
    @colors = { ##should probably move to diff class
      1 => "🟦",
      2 => "🟨",
      3 => "🟥",
      4 => "🟪",
      5 => "🟧",
      :arrow => "⬅",
      :noarrow => " ",
      :correct => "🟢",
      :correctcolor => "⚪️",
      :wrong => "⚫️",
    }

    @block_chars = { ##should probably move to diff class
      1 => 3,
      2 => 7,
      3 => 11,
      4 => 15,
      5 => 19,
      :arrow => 24,
      :peg1 => 25,
      :peg2 => 26,
      :peg3 => 27,
      :peg4 => 28,
      :peg5 => 29,
    }

    @block_num  = 1 ##should probably move to diff class
    @round = 0 ##should probably move to diff class
    generate_order
  end

  def get_input
    @input = gets.chomp.to_i
  end

  def generate_order
    color_array = ["1", "2", "3", "4", "5"]
    @order = Array.new(5) { color_array.sample }
  end

  def block_num_incr ##should probably move to diff class
    @block_num  += 1
  end

  def round_incr ##should probably move to diff class
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

    puts @player.order
    (1..12).each do
      one_round(@player)
      correct_order? 
      correct_color?
      wrong?
      pegs
      # binding.pry
      @player.round_incr
      # if (player.round < 12); puts "\e[2J"; end
    end
  end

    def one_round(player)
      rows.each do 
        |row|
        rows[player.round].single_row[(player.block_chars[:arrow])]=(player.colors[:arrow])
        row.refresh_display(row)
      end
      puts @@key 
      (1..5).each do |i|
        player.get_input 
        # binding.pry
        rows[player.round].guesses.push(player.input.to_s)
        rows[player.round].single_row[(player.block_chars[i])]=(player.colors[player.input])
        #  puts "\e[2J"
        rows.each {|row| row.refresh_display(row)}
        puts @@key 
        if i === 5 
          rows[player.round].single_row[(player.block_chars[:arrow])]=(player.colors[:noarrow])
        end 
      end   
    end

    def score_round
    end 

    def correct_order? 
      
      @player.order.each_with_index do
        |v, i|
        # binding.pry
        v == @rows[@player.round].guesses[i] ? @rows[@player.round].correct.push(v) : false 
        print  @rows[@player.round].correct
      end
    end

    def correct_color?
      @rows[@player.round].correctcolor = (@player.order & @rows[@player.round].guesses) | @rows[@player.round].correct
      print @rows[@player.round].correctcolor
    end


    def wrong?
      # binding.pry
      @rows[@player.round].wrong = [1, 2, 3, 4, 5]
      puts @player.order
    end


    def pegs
      pegs = [:peg1, :peg2, :peg3, :peg4, :peg5]

      (0...(@rows[@player.round].wrong.length)).each do |i|
        # binding.pry
        rows[@player.round].single_row[(@player.block_chars[pegs[i]])]=(@player.colors[:wrong])
      end    

      (0...(@rows[@player.round].correctcolor.length)).each do |i|
        # binding.pry
        rows[@player.round].single_row[(@player.block_chars[pegs[i]])]=(@player.colors[:correctcolor])
      end
        # binding.pry

      (0...(@rows[@player.round].correct.length)).each do |i|
          # binding.pry
        rows[@player.round].single_row[(@player.block_chars[pegs[i]])]=(@player.colors[:correct])
      end


    end
    # def winning_condition
    # ##if all peg spots are green you win
    # if @player.colors[:correct] == rows[@player.round].single_row[(@player.block_chars[:peg1])] && rows[@player.round].single_row[(@player.block_chars[:peg2])] && rows[@player.round].single_row[(@player.block_chars[:peg3])] && rows[@player.round].single_row[(@player.block_chars[:peg4])] && rows[@player.round].single_row[(@player.block_chars[:peg5])]
    # end
  ##create array with guesses for each row in row objects
  ##compare guesses with order array from player object (maybe intersection, need to see how this would work)
  ## push to array with correct colors correct order
  ## push to array with correct colors wrong order
  ## push to array with just wrong  

  ##iterate array.length for each of the above with corresponding pegs printed to screen
end


Game.new


#make conscious effort to use CONSTANTS for things that aren't going to change, realized during this project that CONSTANTS are in scope for class methods. 

