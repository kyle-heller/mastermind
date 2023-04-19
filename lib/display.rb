# frozen_string_literal: true

# display class
class Display
  def initialize
    test
  end

  def self.display_guess(guess)
    guess.each do |gv|
      print Board.colors_and_assets[gv.to_i]
      print "  "
    end
    print "| "
  end

  def clear 
  end

end