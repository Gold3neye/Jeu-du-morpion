class Game
  attr_accessor :human_player
  $win = [['A1','A2','A3'],['B1','B2','B3'],['C1','C2','C3'],['A1','B1','C1'],['A2','B2','C2'],['A3','B3','C3'],['A1','B2','C3'],['A3','B2','C1']]
  $cells_possible = ['A1','A2','A3','B1','B2','B3','C1','C2','C3']
  

  def board
    puts "       A             B            C     "
    puts "              |            |            "
    puts "              |            |            "
    puts "1      #{@board[0]}      |      #{@board[1]}     |      #{@board[2]}     "
    puts "              |            |            "
    puts "              |            |            "
    puts "  --------------------------------------"
    puts "              |            |            "
    puts "              |            |            "
    puts "2      #{@board[3]}      |      #{@board[4]}     |      #{@board[5]}     "
    puts "              |            |            "
    puts "              |            |            "
    puts "  --------------------------------------"
    puts "              |            |            "
    puts "              |            |            "
    puts "3      #{@board[6]}      |      #{@board[7]}     |      #{@board[8]}     "
    puts "              |            |            "
    puts "              |            |            "

  end
  
  def initialize(player1, player2)
    @player1 = Player.new("#{player1}")
    @player2 = Player.new("#{player2}")
    @actions = []
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def is_still_ongoing?
    test_end
    if @actions.sort == $cells_possible || @a.include?(true) || @b.include?(true)
      return false
    else return true
    end
  end

  def action_choice_possible(action)
    if @actions.include?(action) == false && $cells_possible.include?(action)
      return true
    else 
      return false
    end
  end

  def board_get(action,symbol)
    if action == 'A1'
      @board[0] = symbol
    elsif action == 'B1'
      @board[1] = symbol
    elsif action == 'C1'
      @board[2] = symbol
    elsif action == 'A2'
      @board[3] = symbol
    elsif action == 'B2'
      @board[4] = symbol
    elsif action == 'C2'
      @board[5] = symbol
    elsif action == 'A3'
      @board[6] = symbol
    elsif action == 'B3'
      @board[7] = symbol
    elsif action == 'C3'
      @board[8] = symbol
    end
  end

  def action_p1(action)
    @player1.action_choice(action)
    self.board_get(action,'X'.colorize(:green))
    @actions << action
    @player1.cells.sort
  end

  def action_p2(action)
    @player2.action_choice(action)
    self.board_get(action,'O'.colorize(:red))
    @actions << action
    @player2.cells.sort
  end

  def test_end
    @a=[]
    $win.map{|i| if @player1.cells.include?(i[0]) && @player1.cells.include?(i[1]) && @player1.cells.include?(i[2]) then @a << true end}
    @b=[]
    $win.map{|i| if @player2.cells.include?(i[0]) && @player2.cells.include?(i[1]) && @player2.cells.include?(i[2]) then @b << true end}
  end
  
  def end
    test_end
    puts "\n"
    puts "La partie est finie"
    if @a.include?(true)
      puts "#{@player1.name} a gagné !".colorize(:green)
    elsif @b.include?(true)
      puts "#{@player2.name} a gagné !".colorize(:red)
    else
      puts "Personne n'a gagné"
    end
  end

  def new_game
    @board = [" "," "," "," "," "," "," "," "," "]
    @a = []
    @b = []
    @player1.cells = []
    @player2.cells = []
    @actions = []
  end
end