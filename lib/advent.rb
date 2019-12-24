require_relative 'day01'

class Advent

  def self.start
    puts 'AdventOfCode 2019'

    day = Day01.new
    day.load
    day.run_part1
    day.run_part2
  end
end

Advent.start
