require_relative 'black_jack'
require_relative 'card'
require_relative 'user'
require_relative 'dealer'
require_relative 'deck'
require_relative 'interface'


class NewGame
  def initialize
    user = User.new
    black_jack = BlackJack.new(user)
    Interface.new(black_jack)
  end
end

NewGame.new