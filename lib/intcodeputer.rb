class IntCodeputer

  attr_accessor :tape
  attr_accessor :ptr

  def initialize
    @tape = Array.new
    @tape_original = Array.new
    @ptr = 0
    @filename = ''
  end

  def load(filename)
    @filename = filename
    f = File.open(filename)
    line = f.gets

    @tape_original = line.split(',').map(&:to_i)
    @tape = @tape_original.map(&:to_i)
  end

  def reset
    @tape = @tape_original.dup
    @ptr = 0
  end

  def execute

    instr = self.param(0)
    while instr != 99 do

      # puts("OpCode: #{@tape[@ptr..(@ptr+3)]}")
      case instr
      when 1
        # Add
        self.add
      when 2
        # Multiply
        self.mult
      else
        puts "Unknown Instruction! #{instr} at position #{@ptr}"
        return
      end

      instr = self.next_instr
    end
  end

  def value
    @tape[@ptr]
  end

  def value_at(ptr)
    @tape[ptr]
  end

  def halt_result
    @tape[0]
  end

  def next_instr(shift=4)
    @ptr += shift
    self.value
  end

  def param(offset)
    @tape[@ptr+offset]
  end

  def add
    out_ptr = self.param(3)
    a_ptr = self.param(1)
    b_ptr = self.param(2)
    a_val = @tape[a_ptr]
    b_val = @tape[b_ptr]
    # puts "Setting #{out_ptr} to #{a_val + b_val} (from #{a_ptr} and #{b_ptr})"
    @tape[out_ptr] = a_val + b_val
  end

  def mult
    out_ptr = self.param(3)
    a_ptr = self.param(1)
    b_ptr = self.param(2)
    a_val = @tape[a_ptr]
    b_val = @tape[b_ptr]
    # puts "Setting #{out_ptr} to #{a_val + b_val} (from #{a_ptr} and #{b_ptr})"
    @tape[out_ptr] = a_val * b_val
  end
end