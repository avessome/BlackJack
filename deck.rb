# The Deck class fills the deck with cards, shuffles the deck and deals cards.
class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card::SUIT.each do |suit|
      Card::VALUE.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end

    @cards.shuffle!
  end

  def deal
    @cards.delete(@cards.last)
  end
end
