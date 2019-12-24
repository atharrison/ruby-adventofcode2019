class Day01

  def initialize
    @data = Array.new
  end

  def load
    f = File.open("data/day01/day01_input.txt")
    while line = f.gets do
      if line != nil
        @data << line.to_i
      end
    end
  end

  def run

    total = 0

    for d in @data do
      total += d / 3
      total -= 2
    end

    puts "Total: #{total}"
  end

  private

end