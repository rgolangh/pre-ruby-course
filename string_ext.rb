class StringExt
  def initialize(a , b)
    @strings = [a, b]
  end

  def concat()
    @strings[0] + @strings[1]
  end

  def substract()
    @strings[0].gsub(@strings[1], "")
  end
end
