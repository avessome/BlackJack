#The BlackJack class contains game mechanics.
class BlackJack
  attr_reader :user, :dealer, :bank, :deck

  def initialize(user)
    @user = user
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = 0
  end

  BET = 10

  def new_con
    return unless @bank.zero?
    return if @user.money < BET || @dealer.money < BET

    @deck = Deck.new
    @bank += user.make_bet(BET)
    @bank += dealer.make_bet(BET)
    @user.cards.clear
    @dealer.cards.clear
    @user.cards << @deck.deal
    @dealer.cards << @deck.deal
    @user.cards << @deck.deal
    @dealer.cards << @deck.deal
    @user.sum
    @dealer.sum
  end

  def win
    if @user.sum > @dealer.sum && @user.sum <= 21
      @user
    elsif @dealer.sum > @user.sum && @dealer <=21
      @dealer
    elsif @user.sum > 21
      @dealer
    elsif @dealer.sum > 21
      @user
    elsif @user.sum == @dealer.sum
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
