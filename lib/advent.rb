require_relative 'day01'

class Advent

  def self.start
    puts 'AdventOfCode 2019'

    day = Day01.new
    day.load
    day.run
  end
end

Advent.start
