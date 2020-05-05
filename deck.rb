# The Deck class fills the deck with cards, shuffles the deck and deals cards.
class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Cards::SUIT.each do |suit|
      Cards::VALUE.each do |rank|
        @cards << Cards.new(suit, rank)
      end
    end

    @cards.shuffle!
  end

  def deal
    @cards.delete(@cards.last)
  end
end
