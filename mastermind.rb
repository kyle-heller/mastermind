class Rows
attr_accessor :single_row

def initialize
@single_row = 
" ⬛️  ⬛️  ⬛️  ⬛️  ⬛️     
+---+---+---+---+---+"
end

def refresh_display(row_1, player)
  puts "\e[2J"
  row_1.single_row[1]=(player.colors[player.input])
  puts row_1.single_row
end

def to_s
puts @single_row
end

def print_row
  puts @single_row
  end

@@all_rows = 
" ⬛️  ⬛️  ⬛️  ⬛️  ⬛️     
+---+---+---+---+---+
 ⬛️  ⬛️  ⬛️  ⬛️  ⬛️    
+---+---+---+---+---+
 ⬛️  ⬛️  ⬛️  ⬛️  ⬛️    
+---+---+---+---+---+
 ⬛️  ⬛️  ⬛️  ⬛️  ⬛️    
+---+---+---+---+---+
 ⬛️  ⬛️  ⬛️  ⬛️  ⬛️    
+---+---+---+---+---+
 ⬛️  ⬛️  ⬛️  ⬛️  ⬛️    
+---+---+---+---+---+
 ⬛️  ⬛️  ⬛️  ⬛️  ⬛️     
+---+---+---+---+---+
 ⬛️  ⬛️  ⬛️  ⬛️  ⬛️    
+---+---+---+---+---+
 ⬛️  ⬛️  ⬛️  ⬛️  ⬛️    
+---+---+---+---+---+
 ⬛️  ⬛️  ⬛️  ⬛️  ⬛️    
+---+---+---+---+---+
 ⬛️  ⬛️  ⬛️  ⬛️  ⬛️    
+---+---+---+---+---+
 ⬛️  ⬛️  ⬛️  ⬛️  ⬛️    
+---+---+---+---+---+"


@@key = 
"                                    
Enter your guess: 1🟦 2🟨 3🟥 4🟪 5🟧"

end

class Player
  attr_reader :colors, :input, :order
  def initialize
    @colors = {
      1 => "🟦",
      2 => "🟨",
      3 => "🟥",
      4 => "🟪",
      5 => "🟧",
    }
    generate_order #when player is initialized generate new color order, maybe new game will just be new instance of player and rows
  end

  def get_input
    @input = gets.chomp.to_i
  end

  def generate_order
    color_array = ["1", "2", "3", "4", "5"]
    @order = Array.new(5) { color_array.sample }
    end

end

row_1 = Rows.new
player = Player.new
player.get_input
row_1.refresh_display(row_1, player)
puts row_1
puts player.colors

player_choice = gets.chomp.to_i 
row_1.single_row[17]=("🟦") #update row with color in spot
puts row_1

def generate_order
color_array = ["1", "2", "3", "4", "5"]
order = Array.new(5) { color_array.sample }
end

def refresh_display
  puts "\e[2J"
  #put rows
end

puts grid
puts key
gets  

#Make guess to key key 1🟦 2🟨 3🟧 4🟪 5🟥
# 2, 5, 8, 11, 14 are square chars in each row
# 1, 5, 9, 13, 17 are square chars in each row
#get guess and include arrow showing current line ⬅
#as player enters guesses have them update and display in the grid
#don't show pegs until after guess made, then display pegs ⚫️ for wrong ⚪️ right color wrong space 🟢 right color right space
#make concious effor to use CONSTANTS for things that aren't going to change, realized during this project that CONSTANTS are in scope for class methods. 

#classes
#maybe each row should be a self contained round with a corresponding "row" object
#player class that has default methods for playing the game as player, 
#and computer class that inherits from player class but overwrites methods 
