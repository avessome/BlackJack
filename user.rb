# The User class contains username, cards and total points and amount of money.
class User
  attr_accessor :name, :money, :cards_sum
  attr_reader :cards

  def initialize(name = 'User')
    @name = name
    @money = 100
    @cards = []
    @cards_sum = 0
  end

  def take_cards(deck)
    return if @cards.size == 3
    @cards << deck.deal
    sum
  end

  def sum
    @cards_sum = @cards.sum(&:value)
    @cards_sum -= 10 if @cards.any?(&:ace) && @cards_sum > 21
  end

  def make_bet(bet)
    return if @money < bet

    @money -= bet
    bet
  end
end
