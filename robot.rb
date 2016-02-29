class Robot

ILLEGAL = "Illegal Move"
ILLEGAL_MOVE = "Out of board bounds"
DONE = "Done"
PLACE = "PLACE"
MOVE = "MOVE"
LEFT = "LEFT"
RIGHT = "RIGHT"
REPORT = "REPORT"

N = 0
E = 1
S = 2
W = 3

DIRS = [N, E, S, W]

  def initialize()
    @x = -1
    @y = -1
    @f = -1
  end

  def command(verb, *args)
    if verb != PLACE && @x == -1
      return ILLEGAL
    end
    puts case verb
    when PLACE
      return place(args[0], args[1])
    when MOVE
      return move
    when LEFT
      return left
    when RIGHT
      return right
    when REPORT
      return report
    end
  end

  def place(x, y)
    @x = x
    @y = y
    @f = N
    DONE
  end

  def move
    x1 = 0
    y1 = 0
    puts case @f
    when N
      x1 = @x
      y1 = @y + 1
    when S
      x1 = @x
      y1 = @y - 1
    when E
      x1 = @x + 1
      y1 = @y
    when W
      x1 = @x - 1
      y1 = @y
    end

    if !validPos(x1, y1)
      return ILLEGAL_MOVE
    end

    puts "moving to #{x1} #{y1}"
    @x = x1
    @y = y1
    DONE
  end

  def left
    @f = DIRS[@f - 1]
    puts "Turning left to #{@f}"
  end

  def right
    @f = DIRS[(@f + 1) % (DIRS.length + 1)]
  end

  def report
    [@x, @y, @f]
  end

  def validPos(x, y)
    puts "check if #{x} and #{y} are valid"
    (x >= 0 && x <= 25) && (y >= 0 && y <= 25)
  end

end




