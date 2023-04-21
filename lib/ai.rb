# frozen_string_literal: true

# AI Module
class AI
  def self.generate_code(game)
    4.times { game.code << rand(1..4).to_s }
  end
end
