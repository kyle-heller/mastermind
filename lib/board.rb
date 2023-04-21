# frozen_string_literal: true

# Handles board
class Board
  COLORS_AND_ASSETS = {
    1 => "🟦",
    2 => "🟨",
    3 => "🟥",
    4 => "🟪",
    5 => "🟧",
  }

  def initialize
  end

  def self.colors_and_assets
    COLORS_AND_ASSETS
  end
end

