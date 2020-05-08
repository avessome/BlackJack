#The BlackJack class contains game mechanics.
class BlackJack
  BET = 10

  attr_reader :user, :dealer, :bank, :deck

  def initialize(user)
    @user = user
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = 0
  end

  def new_con
    return unless @bank.zero?
    return if @user.money < BET || @dealer.money < BET

    @deck = Deck.new
    @user.cards.clear
    @dealer.cards.clear
    @bank += user.make_bet(BET)
    @bank += dealer.make_bet(BET)
    @user.cards << @deck.deal
    @dealer.cards << @deck.deal
    @user.cards << @deck.deal
    @dealer.cards << @deck.deal
    @user.sum
    @dealer.sum
  end

  def win
    if @user.cards_sum > @dealer.cards_sum && @user.cards_sum <= 21
      @user
    elsif @dealer.cards_sum > @user.cards_sum && @dealer <= 21
      @dealer
    elsif @user.cards_sum > 21
      @dealer
    elsif @dealer.cards_sum > 21
      @user
    elsif @user.cards_sum == @dealer.cards_sum
      nil
    end
  end

  def share
    if win.nil?
      @user.money += @bank / 2
      @dealer.money += @bank / 2
    else
      win.money += @bank
    end
    @bank = 0
  end
end
