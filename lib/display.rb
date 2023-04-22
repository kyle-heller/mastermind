# frozen_string_literal: true

# Display class provides additional methods for displaying text in the console, including the display of guesses and clearing the console.
class Display
  def self.display_guess(guess)
    guess.each do |gv|
      # print "#{gv}-"
      print Board.colors_and_assets[gv.to_i]
      print "  "
    end
    print "| "
  end

  def self.display_code(code)
    print "The code:  "
    code.each do |cv|
      print Board.colors_and_assets[cv.to_i]
      print "  "
    end
    print "\n"
  end

  def self.clear_screen
    system('clear') || system('cls')
  end
end
