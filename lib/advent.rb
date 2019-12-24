require_relative 'day01'
require_relative 'day02'
require_relative 'day03'

class Advent

  def self.start
    puts 'AdventOfCode 2019'

    day = Day03.new
    daynum = "03"
    day.load("data/day#{daynum}/day#{daynum}_input.txt")
    # day.load("data/day#{daynum}/day#{daynum}_input_sample2.txt")
    day.run_part1
    # day.run_part2
  end
end

Advent.start
