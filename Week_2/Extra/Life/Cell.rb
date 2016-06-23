require 'rspec'
require 'pry'
require 'colorize'

class Life
  def initialize

    @grid = [
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,1,0,0,0,0,0],
      [0,0,0,0,1,0,0,0,0,0],
      [0,0,0,0,1,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0]
    ]



   @newgrid = [
     [0,0,0,0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0,0,0,0]
   ]

  end


  def play


    @grid.each_with_index do |yitem, y|
      yitem.each_with_index do |xitem, x|
        neighbours = check_neighbours(y,x, @grid)
        current_cell = Cell.new(@grid[y][x], neighbours, [y,x])
        current_cell.regenerate
        @newgrid[y][x] = current_cell.dup.state

      end

    end


    @grid = @newgrid.dup


    # @grid.each do |y|
    #   y.each do |x|
    #     if x == 0
    #       print "   ".white.on_white
    #     elsif x == 1
    #       print " 1 ".green.on_green
    #     end
    #   end
    #   print "\n"
    # end
    sleep 1
    system "clear"

    puts "\n"



  play


  end


  def check_neighbours(y, x, grid)
    neighbours_array = []

    # xplus =
    # xmins
    # yplus
    # yminus

  if !(y == 0) && !(x == 0)

      if @grid[y+1]
        neighbours_array << @grid[y+1][x]
        neighbours_array << @grid[y+1][x+1]
        neighbours_array << @grid[y+1][x-1]
      end

    neighbours_array << @grid[y-1][x]
    neighbours_array << @grid[y][x+1]
    neighbours_array << @grid[y][x-1]
    neighbours_array << @grid[y-1][x-1]
    neighbours_array << @grid[y-1][x+1]

    if @grid[y][x] == 1
      binding.pry
    end


  elsif !(y == 0) && (x == 0)

    if @grid[y+1]
      neighbours_array << @grid[y+1][x]
      neighbours_array << @grid[y+1][x+1]
    end
    neighbours_array << @grid[y-1][x]
    neighbours_array << @grid[y][x+1]
    neighbours_array << @grid[y-1][x+1]


  elsif (y == 0) && (x == 0)

    neighbours_array << @grid[y+1][x]
    neighbours_array << @grid[y][x+1]
    neighbours_array << @grid[y+1][x+1]

  elsif (y == 0) && !(x == 0)

    neighbours_array << @grid[y+1][x]

    neighbours_array << @grid[y][x+1]
    neighbours_array << @grid[y][x-1]

    neighbours_array << @grid[y+1][x+1]

    neighbours_array << @grid[y+1][x-1]



  end

    return neighbours_array


  end


end

class Cell
  attr_accessor :state, :neighbours
  def initialize(state, neighbours, coord)
    @state = state # either 1 or 0 for alive or dead
    @neighbours = neighbours # an array that represents the surrounding cells
    @coord = coord
  end

  def regenerate
    activeneighbours = @neighbours.select {|x| x == 1}

      if activeneighbours.class == Array

        if ((activeneighbours.length == 3) || (activeneighbours.length == 2)) && (@state ==1)
          @state = 1


        elsif (activeneighbours.length == 3) && (@state ==0)
          @state = 1
        elsif activeneighbours.length >3
          @state = 0
        elsif activeneighbours.length < 2
          # if (@state ==1)
          #   binding.pry
          # end

          @state = 0


        end

      else
        @state = 0
      end


  end
end

describe Cell do

  describe '#regenerate' do
    it "regenerates a live cell from a live cell if it has 2 neighbours" do
      cell1 = Cell.new(1, [0,0,0,0,0,0,1,1])
      expect(cell1.regenerate).to eq(1)
    end
  end

  describe '#regenerate' do
    it "regenerates a dead cell from a dead cell if it has 0 neighbours" do
      cell1 = Cell.new(0, [0,0,0,0,0,0,0,0])
      expect(cell1.regenerate).to eq(0)
    end
  end

  describe '#regenerate' do
    it "regenerates a live cell from a dead cell if it has 3 neighbours" do
      cell1 = Cell.new(0, [1,1,1,0,0,0,0,0])
      expect(cell1.regenerate).to eq(1)
    end
  end

  describe '#regenerate' do
    it "regenerates a dead cell from a live cell if it has more than 3 neighbours" do
      cell1 = Cell.new(0, [1,1,1,1,0,0,0,0])
      expect(cell1.regenerate).to eq(0)
    end
  end

  # write more tests to cover all cases

end



game = Life.new
game.play
