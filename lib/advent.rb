require_relative 'day01'
require_relative 'day02'

class Advent

  def self.start
    puts 'AdventOfCode 2019'

    day = Day02.new
    day.load("data/day02/day02_input.txt")
    # day.run_part1
    day.run_part2
  end
end

Advent.start
