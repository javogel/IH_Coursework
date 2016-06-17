require 'colorize'
require 'pry'
require 'json'


class ChessValidator

  def initialize
    @board = []
    @board_file = 'complex_board.txt'
    @moves_file = 'complex_moves.txt'
    @moves_array = []
  end


  def load_board
    File.readlines(@board_file).each do |line|
      # @board << JSON.parse(line)
      @board << line.split(" ")
    end

    #convert board to symbols and nils
    @board.each_with_index do |line, y|
      line.each_with_index do |spot, x|
        if spot == "--"
          @board[y][x]=nil
        else
          # uncomment below line if you want to make each a spot symbol
          @board[y][x] = spot.to_sym


        end
      end
    end

    # call functions that converts board to objects
    convert_board_to_objects
  end

  def convert_board_to_objects
    @board.each_with_index do |line, y|
      line.each_with_index do |spot, x|
      split_spot = spot.to_s.split("")
      color = split_spot[0]

        if spot == nil
          next
        elsif split_spot[1].upcase == "K"
          @board[y][x]= King.new(color)
        elsif split_spot[1].upcase == "Q"
          @board[y][x]= Queen.new(color)
        elsif split_spot[1].upcase == "R"
          @board[y][x]= Rook.new(color)
        elsif split_spot[1].upcase == "P"
          @board[y][x]= Pawn.new(color)
        elsif split_spot[1].upcase == "B"
          @board[y][x]= Bishop.new(color)
        elsif split_spot[1].upcase == "N"
          @board[y][x]= Knight.new(color)

        else

         puts "Element missed"

        end
      end
    end

  end


  def load_moves
    File.readlines(@moves_file).each do |line|
      @moves_array << line.split(" ")
    end

    @moves_array.each do |x|

      convert_moves(x[0], x[1])
    end
  end


  def convert_moves(from, to)
      horizontal = {:a => 0, :b => 1, :c => 2, :d => 3, :e => 4, :f => 5, :g => 6, :h => 7}
      vertical = {8 => 0, 7 => 1, 6 => 2, 5 => 3, 4 => 4, 3 => 5, 2 => 6, 1 => 7}

      from_letter = from[/[[:alpha:]]/]
      from_number = from[/\d+/].to_i
      to_letter = to[/[[:alpha:]]/]
      to_number = to[/\d+/].to_i

      from_converted = [ horizontal[from_letter.to_sym], vertical[from_number]]
      to_converted = [ horizontal[to_letter.to_sym], vertical[to_number]]



      # puts "form #{from_converted.to_s} going to  #{to_converted.to_s}"

      validate_move(from_converted, to_converted)
  end


  def validate_move(from, to)

      piece_to_move = @board[from[1]][from[0]]

      if @board[from[1]][from[0]] != nil
        piece_to_move.valid_piece_move(from, to, @board)
      else
        puts "Invalid - piece non existent"
      end

  end

end


class Piece
 attr_accessor :color

  def initialize(color)
    @color = color
  end

  def is_spot_enemy(to,board)
    if board[to[1]][to[0]] == nil
      false
    elsif board[to[1]][to[0]].color != @color
      true
    else
      false
    end

  end

  def is_spot_open(to, board)
    #checks whether spot is open to make move by checking if an oponents piece is there or if it is empty
    if (board[to[1]][to[0]] == nil)
      true
    else
      false
    end
  end

  #check if there are no other pieces in the way between two points
  def check_path_open (from, to, board)
    #refine
    true


    #Check if diagonal
     if (to[1]-from[1]).abs == (to[0]-from[0]).abs

    #check if it moves vertical
  elsif ((to[0]==from[0])&&(to[1]!=from[1]))

    #check if it moves horizontal
  elsif ((to[1]==from[1])&&(to[0]!=from[0]))
     to[0]-from
     
     end

  end



  def valid_piece_move(from, to, board)
    if (is_spot_open(to, board) || is_spot_enemy(to, board)) && passes_move_restrictions(from, to, board)
       puts "Valid"
    else
      puts "Invalid - #{self.class} cannot move like that"
    end

  end




end

class King < Piece
  attr_accessor :color

  def initialize(color)
    super(color)
  end


  def passes_move_restrictions(from, to, board)

    #checks absolute value of difference and make sure it is less thna one accoridng to King's moves
    if ( (to[0]-from[0]).abs <= 1 ) && ( (to[1]-from[1] ).abs <= 1)
      true
    else
      false
    end

  end

end


class Queen < Piece
  attr_accessor :color

  def initialize(color)
    super(color)
  end


  def passes_move_restrictions(from, to, board)

    if ((to[0]==from[0])&&(to[1]!=from[1]) || (to[0]==from[0])&&(to[1]!=from[1])) && check_path_open(from, to, board)
      return true
    else
      return false
    end


  end

end


class Rook < Piece
  attr_accessor :color

  def initialize(color)
    super(color)
  end


  def passes_move_restrictions(from, to, board)

    if ((to[0]==from[0])&&(to[1]!=from[1]) || (to[0]==from[0])&&(to[1]!=from[1])) && check_path_open(from, to, board)
      return true
    elsif ((to[0]-from[0]).abs == (to[1]-from[1] ).abs) && check_path_open(from,to)
      return true
    else
      return false
    end


  end



end

class Knight < Piece
  attr_accessor :color

  def initialize(color)
    super(color)
  end




  def passes_move_restrictions(from, to, board)

    if (( (to[0]-from[0]).abs == 1 ) && ( (to[1]-from[1] ).abs == 2)) || (( (to[0]-from[0]).abs == 2 ) && ( (to[1]-from[1] ).abs == 1))
      return true
    else
      return false
    end


  end

end

class Bishop < Piece
  attr_accessor :color

  def initialize(color)
    super(color)
  end

  def passes_move_restrictions(from, to, board)

    #check that movement is diagonal
    if  ((to[0]-from[0]).abs == (to[1]-from[1] ).abs) && check_path_open(from,to, board)
      return true
    else
      return false
    end


  end

end



class Pawn < Piece
  attr_accessor :color

  def initialize(color)
    super(color)
  end


  def passes_move_restrictions(from, to, board)

    #check that the pawn moves in the right directiona ccording to color
    if (@color == "b") && !(from[1] < to[1])
      return false
    elsif (@color == "w") && !(from[1] > to[1])
      return false
    end

    if @color=="b"
      primera_posicion = 1
    elsif @color=="w"
      primera_posicion = 6
    end

    #check that it moves only 1 step. If it moves diagonal and make sure it is eating another piece
    if (to[1]-from[1]).abs ==1
        if (to[0] != from[0]) && !is_spot_enemy(to, board)
          return false
        end
      return true
    end

    if ((to[1]-from[1]).abs ==2) && (from[1]==primera_posicion)
      return true
    end

  end



end


play = ChessValidator.new
play.load_board
play.load_moves
