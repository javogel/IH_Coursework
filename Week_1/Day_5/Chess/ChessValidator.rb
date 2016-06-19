class ChessValidator
 attr_accessor :responses
  def initialize
    @board = []
    @board_file = 'complex_board.txt'
    @moves_file = 'complex_moves.txt'
    @moves_array = []
    @responses = []
    @responses_file = 'responses.txt'
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
        if piece_to_move.valid_piece_move(from, to, @board)
          puts "Valid"
          @responses << "Valid"
        else
          puts "Invalid - move not possible for #{@board[from[1]][from[0]].class}"
          @responses << "Invalid - move not possible for #{@board[from[1]][from[0]].class}"
        end
      else
        puts "Invalid - piece non existent"
        @responses << "Invalid - piece non existent"
      end

  end


  def save_responses
    open(@responses_file, 'w') do |f|
      @responses.each do |x|
        f << x + "\n"
      end
    end
  end

end
