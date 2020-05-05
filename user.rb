# The User class contains username, cards and total points and amount of money.
class User
  attr_accessor :username, :amount_of_money, :cards_sum
  attr_reader :cards

  def initialize(name = 'Username')
    @username = username
    @amount_of_money = 100
    @cards = []
    @cards_sum = 0
  end

  def take_cards(deck)
    @cards << deck.deal
    sum
  end

  def sum
    @cards_sum = @cards.sum(:&value)
    @cards_sum -= 10 if @cards.any?(:&ace) && @cards_sum > 21
  end

  def make_bet(bet)
    return if @amount_of_money < bet

    @amount_of_money -= bet
    bet
  end
end
