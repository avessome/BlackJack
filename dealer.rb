#the Dealer class inherits from the User class
class Dealer < User
  def initialize
    super 'Dealer'
  end

  def take_cards(deck)
    @cards << deck.deal if @cards_sum < 17
    sum
  end
end
