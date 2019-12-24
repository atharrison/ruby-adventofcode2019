class IntCodeputer

  def initialize
    @tape = Array.new
    @ptr = 0
  end

  def load(filename)
    f = File.open(filename)
    while line = f.gets do
      @tape = line.split(',').map{|s| s.to_i}
    end

  end

  def execute

    cmd = self.val(0)
    while cmd != 99 do

      puts("OpCode: #{@tape[@ptr..(@ptr+3)]}")
      case cmd
      when 1
        # Add
        self.add
      when 2
        # Multiply
        self.mult
      else
        puts "Unknown Command! #{cmd} at position #{@ptr}"
        return
      end

      @ptr += 4
      cmd = self.val(0)
    end
  end

  def val(offset)
    @tape[@ptr+offset]
  end

  def add
    out_ptr = self.val(3)
    a_ptr = self.val(1)
    b_ptr = self.val(2)
    a_val = @tape[a_ptr]
    b_val = @tape[b_ptr]
    # puts "Setting #{out_ptr} to #{a_val + b_val} (from #{a_ptr} and #{b_ptr})"
    @tape[out_ptr] = a_val + b_val
  end

  def mult
    out_ptr = self.val(3)
    a_ptr = self.val(1)
    b_ptr = self.val(2)
    a_val = @tape[a_ptr]
    b_val = @tape[b_ptr]
    # puts "Setting #{out_ptr} to #{a_val + b_val} (from #{a_ptr} and #{b_ptr})"
    @tape[out_ptr] = a_val * b_val
  end


  def run_day2_part1

    # First, adjust the tape
    @tape[1] = 12
    @tape[2] = 2

    #Run program
    self.execute
    # puts @tape
    puts "Part 1 Result: #{@tape[0]}"
  end
end