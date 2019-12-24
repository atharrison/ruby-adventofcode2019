class Day03

  attr_accessor :grid

  class DirCmd

    attr_reader :direction
    attr_reader :magnitude

    def initialize(raw)
      @direction = raw[0]
      @magnitude = raw[1..-1].to_i
    end

    def to_s
      "#{@direction}->#{@magnitude}"
    end

    def to_str
      self.to_s
    end
  end

  def initialize
    gridsize = 15000
    @startxy = 7500
    # gridsize = 500
    # @startxy = 250
    # gridsize = 12
    # @startxy = 0
    @grid = Array.new(gridsize){Array.new(gridsize, 0)}
    @x = @startxy
    @y = @startxy
  end

  def load(filename)
    f = File.open(filename)
    @line1 = f.gets.split(',').map{|s| DirCmd.new(s)}
    @line2 = f.gets.split(',').map{|s| DirCmd.new(s)}

  end

  def run_part1
    # puts "Line1: #{@line1}"
    # puts "Line2: #{@line2}"

    paint_line(@line1)
    intersections = collect_intersections(@line2)

    puts "#{intersections}"

    smallest_dist = -1

    for inter in intersections do
      dist = manhattan([@startxy, @startxy], inter)
      if smallest_dist == -1 || dist < smallest_dist
        smallest_dist = dist
      end
    end

    puts "Part1 Result: #{smallest_dist}"
  end

  def run_part2
    paint_line_deluxe(@line1)
    intersections = collect_intersections(@line2)
    puts "Intersections: #{intersections}"

    line2_lowest = find_steps_to_intersections(@line2, intersections)
    puts "Line2 lowest step pairs: #{line2_lowest}"

    lowest = line2_lowest.map{|item| item.reduce(0, :+)}.min

    puts "Part 2 Lowest total: #{lowest}"

  end

  def find_steps_to_intersections(line, intersections)
    m = @startxy
    n = @startxy

    steps = 0
    steps_count = Array.new

    for cmd in line do
      case cmd.direction
      when 'L'
        (1..cmd.magnitude).each do |c|
          steps += 1
          m -= 1
          if intersections.include? [m, n]
            steps_count << [@grid[m][n], steps]
          end
        end
      when 'R'
        (1..cmd.magnitude).each do |c|
          steps += 1
          m += 1
          if intersections.include? [m, n]
            steps_count << [@grid[m][n], steps]
          end
        end
      when 'U'
        (1..cmd.magnitude).each do |c|
          steps += 1
          n += 1
          if intersections.include? [m, n]
            steps_count << [@grid[m][n], steps]
          end
        end
      when 'D'
        (1..cmd.magnitude).each do |c|
          steps += 1
          n -= 1
          if intersections.include? [m, n]
            steps_count << [@grid[m][n], steps]
          end
        end
      else
        puts "Unknown direction! #{cmd.direction}"
        return
      end
    end
    steps_count
  end

  def manhattan(point1, point2)
    (point2[0] - point1[0]).abs + (point2[1] - point1[1]).abs
  end

  def collect_intersections(line)

    m = @startxy
    n = @startxy

    intersections = Array.new

    for cmd in line do
      case cmd.direction
      when 'L'
        (1..cmd.magnitude).each do |c|
          m -= 1
          if @grid[m][n] >= 1
            intersections << [m, n]
          end
        end
      when 'R'
        (1..cmd.magnitude).each do |c|
          m += 1
          if @grid[m][n] >= 1
            intersections << [m, n]
          end
        end
      when 'U'
        (1..cmd.magnitude).each do |c|
          n += 1
          if @grid[m][n] >= 1
            intersections << [m, n]
          end
        end
      when 'D'
        (1..cmd.magnitude).each do |c|
          n -= 1
          if @grid[m][n] >= 1
            intersections << [m, n]
          end
        end
      else
        puts "Unknown direction! #{cmd.direction}"
        return
      end
    end

    intersections
  end

  def paint_line(line)

    for cmd in line do
      case cmd.direction
      when 'L'
        (1..cmd.magnitude).each do |m|
          @x -= 1
          @grid[@x][@y] = 1
        end
      when 'R'
        (1..cmd.magnitude).each do |m|
          @x += 1
          @grid[@x][@y] = 1
        end
      when 'U'
        (1..cmd.magnitude).each do |m|
          @y += 1
          @grid[@x][@y] = 1
        end
      when 'D'
        (1..cmd.magnitude).each do |m|
          @y -= 1
          @grid[@x][@y] = 1
        end
      else
        puts "Unknown direction! #{cmd.direction}"
        return
      end
    end
  end

  def paint_line_deluxe(line)

    steps = 0
    for cmd in line do
      case cmd.direction
      when 'L'
        (1..cmd.magnitude).each do |m|
          steps += 1
          @x -= 1
          @grid[@x][@y] = steps if @grid[@x][@y] == 0
        end
      when 'R'
        (1..cmd.magnitude).each do |m|
          steps += 1
          @x += 1
          @grid[@x][@y] = steps if @grid[@x][@y] == 0
        end
      when 'U'
        (1..cmd.magnitude).each do |m|
          steps += 1
          @y += 1
          @grid[@x][@y] = steps if @grid[@x][@y] == 0
        end
      when 'D'
        (1..cmd.magnitude).each do |m|
          steps += 1
          @y -= 1
          @grid[@x][@y] = steps if @grid[@x][@y] == 0
        end
      else
        puts "Unknown direction! #{cmd.direction}"
        return
      end
    end
  end
end