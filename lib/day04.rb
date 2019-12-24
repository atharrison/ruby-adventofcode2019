class Day04

  def load
    # Noop
  end

  def initialize
    @start = 372304
    @end = 847060
  end

  def run_part1

    candidates = []
    (@start..@end).each do |num|
      if valid_password(num)
        candidates << num
      end
    end

    puts "#{candidates}"

    puts "Part 1 Answer: #{candidates.size}"
  end

  def valid_password(number)

    digits = number.to_s.split('')

    pair_found = false
    small = digits[0]
    (1..5).each do |d|
      if digits[d] < small
        return false
      end
      small = digits[d]
      if digits[d] == digits[d-1]
        pair_found = true
      end
    end

    # puts "#{digits}"

    pair_found
  end

end