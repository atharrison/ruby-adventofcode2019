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

  def run_part1

    total = 0

    for d in @data do
      total += d / 3
      total -= 2
    end

    puts "Total Part 1: #{total}"
  end

  def run_part2
    total = 0

    for d in @data do
      module_total = 0

      fuel_part = d / 3 - 2

      while fuel_part > 0
        module_total += fuel_part

        fuel_part = fuel_part / 3 - 2
      end
      total += module_total
    end

    puts "Total Part 2: #{total}"

  end

end