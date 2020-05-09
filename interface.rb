#Interface
class Interface

  attr_reader :black_jack

  def initialize(black_jack)
    @black_jack = black_jack
    start
  end

  def borderline
    puts '-' * 50
  end

  def new_line
    puts "\n"
  end

  def start
    puts "Как Вас зовут?"
    name = gets.chomp
    black_jack.user.name = name
    start_game
  end

  def start_game
    black_jack.new_con
    new_line
    puts "Добро пожаловать в игру, #{black_jack.user.name}"
    new_line

    loop do
      puts "Банк: #{black_jack.bank}\n\n"
      new_line

      borderline
      puts "Ваши деньги: #{black_jack.user.money}\n\n"
      print 'Ваши карты:  '
      black_jack.user.cards.each { |card| print "#{card.rank}#{card.suit}  " }
      new_line
      puts "Сумма очков: #{black_jack.user.cards_sum}"
      borderline

      if black_jack.bank != 0
        puts "Карты Диллера: ***\n\n"
        puts "Сумма очков: ***\n\n"
      else
        print 'Карты Диллера: '
        black_jack.dealer.cards.each { |card| print "#{card.rank}#{card.suit}  " }
        new_line
        puts "Сумма очков: #{black_jack.dealer.cards_sum}"
      end
      borderline

      if black_jack.bank != 0
        start_menu
        input_menu = gets.chomp
        selected(input_menu)
      elsif black_jack.user.money.zero? || black_jack.dealer.money.zero?
        menu_3
        menu = gets.chomp
        selected_3(menu)
      elsif black_jack.deck.cards.size < 52
        menu_2
        menu = gets.chomp
        selected_2(menu)
      end
      break unless menu != '0'
    end
  end

  def start_menu
    messages = ['Выберите действие, введя номер из списка: ',
                borderline,
                ' 1 - Пропустить.',
                ' 2 - Добавить карту.',
                ' 3 - Открыть карты.',
                borderline]
    messages.each { |item| puts item }
  end

  def selected(input_menu)
    if input_menu == '1'
      loop do
        black_jack.dealer.take_cards(black_jack.deck)
        break if black_jack.dealer.cards_sum >= 17
      end
      black_jack.share
    elsif input_menu == '2'
      black_jack.user.take_cards(black_jack.deck)
      black_jack.share if black_jack.user.cards_sum > 21
    elsif input_menu == '3'
      black_jack.share
    end
    messages
  end

  def menu_2
    messages = ['Выберите действие, введя номер из списка: ',
                borderline,
                ' 1 - Продолжить.',
                ' 0 - Выйти из игры.',
                borderline]
    messages.each { |item| puts item }
  end

  def selected_2(menu)
    black_jack.new_con if menu == '1'
  end

  def menu_3
    messages = ['Выберите действие, введя номер из списка: ',
                borderline,
                ' 1 - Новая игра.',
                ' 0 - Выйти из игры.',
                borderline]
    messages.each { |item| puts item }
  end

  def selected_3(menu)
    NewGame.new if menu == '1'
  end

  def messages
    message_user_win if black_jack.bank.zero?
    message_new_con if black_jack.bank.zero?
    message_no_money if black_jack.user.money.zero?
    message_win if black_jack.dealer.money.zero?
  end

  def message_no_money
    puts "Ваши деньги закончились. Вы проиграли!\n\n"
  end

  def message_win
    puts "Поздравляем! Вы выиграли! У Диллера нет денег.\n\n"
  end

  def message_new_con
    puts "Если хотите продолжить нажмите: '1', если нет нажмите: '0'\n\n"
  end

  def message_user_win
    if black_jack.win.nil?
      puts "Ничья!\n\n"
    else
      puts "#{black_jack.win.name} - Победил!\n\n"
      puts "Сумма очков #{black_jack.win.name}: #{black_jack.win.cards_sum}\n\n"
    end
  end
end
