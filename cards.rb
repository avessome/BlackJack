# The Cards class creates cards, and contains their suits and values.
class Cards
  SUIT = ['♠', '♥', '♣', '♦']
  VALUE = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_reader :suit, :value, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
    @value = calculate_value(rank)
  end

  def ace
    @rank == 'A'
  end

  def calculate_value(rank)
    if ace
      11
    elsif ['j', 'Q', 'K']
      10
    else
      rank
    end
  end
end