require_relative "intcodeputer"

class Day02

  def load(filename)
    @intcodeputer = IntCodeputer.new
    @intcodeputer.load(filename)
  end

  def run_part1
    # First, adjust the tape
    @intcodeputer.tape[1] = 12
    @intcodeputer.tape[2] = 2

    #Run program
    @intcodeputer.execute
    # puts @tape
    puts "Part 1 Result: #{@intcodeputer.halt_result}"
  end

  def run_part2

    # First, adjust the tape
    for x in 0..99 do
      for y in 0..99 do
        @intcodeputer.reset
        @intcodeputer.tape[1] = x
        @intcodeputer.tape[2] = y

        # Run program, check result
        @intcodeputer.execute
        if @intcodeputer.halt_result == 19690720
          puts "Part 2 Result: #{x} * 100 + #{y} = #{x*100 + y}"
          return
        else
          if @intcodeputer.halt_result > 1
            puts("Nope, #{x},#{y} result is #{@intcodeputer.halt_result}")
          end
        end
      end
    end
    puts "Finished, no answer?"
  end

end