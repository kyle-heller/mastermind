# frozen_string_literal: true

# Handles board
class Board

  DEFAULT_BOARD = 
    "⬛️  ⬛️  ⬛️  ⬛️\n\n".freeze

  COLORS_AND_ASSETS = {
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

  def initialize
    @current_guess = 0
    @last_guess = 0
  end

  def self.colors_and_assets
    COLORS_AND_ASSETS
  end

  def self.default_board
    DEFAULT_BOARD
  end

end


# @block_chars = { ##should probably move to diff class
#   1 => 3,
#   2 => 7,
#   3 => 11,
#   4 => 15,
#   5 => 19,
#   :arrow => 24,
#   :peg1 => 25,
#   :peg2 => 26,
#   :peg3 => 27,
#   :peg4 => 28,
#   :peg5 => 29,
#   :cpeg1 => 23, 
#   :cpeg2 => 24, 
#   :cpeg3 => 25, 
#   :cpeg4 => 26,
#   :cpeg5 => 27,
# }

# rows[player.round].guesses.push(player.input.to_s)
# rows[player.round].single_row[(player.block_chars[i])]=(player.colors[player.input])
