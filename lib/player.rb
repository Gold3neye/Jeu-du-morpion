class Player
  attr_accessor :name, :cells
  def initialize(name)
    @name = name
    @cells = []
  end
  
  def play(cell)
    @cells << cell
  end

  def action_choice(action)
    play(action)
  end

end