require_relative 'day01'
require_relative 'intcodeputer'

class Advent

  def self.start
    puts 'AdventOfCode 2019'

    # day = Day01.new
    # day.load
    # day.run_part1
    # day.run_part2

    intcodeputer = IntCodeputer.new
    intcodeputer.load("data/day02/day02_input.txt")
    intcodeputer.run_day2_part1

  end
end

Advent.start
