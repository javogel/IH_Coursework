require 'colorize'
require 'pry'
require 'json'


class ChessValidator

  def initialize
    @board = []
    @board_file = 'simple_board.txt'
    @moves_file = 'simple_moves.txt'
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
          @board[y][x] = spot.to_sym
        end
      end
    end

    # print @board
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

      # validate_move(from_converted, to_converted)

      puts "form #{from_converted.to_s} going to  #{to_converted.to_s}"
  end

  def validate_move

  end

end


class Piece
  def initialize
  end
end


class Rook < Piece
  def initialize
  end

end

class Bishop < Piece
  def initialize
  end
end

class Pawn < Piece
  def initialize
  end
end


play = ChessValidator.new
play.load_board
play.load_moves
