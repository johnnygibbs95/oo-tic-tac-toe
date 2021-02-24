class TicTacToe

    attr_accessor

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
      ]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(index, user_input)
        @board[index] = user_input
    end

    def position_taken?(index)
        @board[index] == "O" || @board[index] == "X"
    end

    def valid_move?(index)
        index.between?(0, 8) && !position_taken?(index)
    end

    def turn_count
        @board.count {|x| x == "X" || x == "O" }
    end

    def current_player
        turn_count % 2 == 0 ? "X": "O"
    end

    def turn
        user_input = gets
        index = input_to_index(user_input)
        if !valid_move?(index)
            turn
        else
        move(index, current_player)
        puts display_board
        end
    end

    def won?
        WIN_COMBINATIONS.each do |x| 
            if x.all? {|x| @board[x] == "X"}
                return x 
            elsif
                x.all? {|x| @board[x] == "O"}
                return x
            end
        end
        false
    end

    def full?
        @board.all? {|x| x != " "}
    end

    def draw?
        !won? && full?
    end

    def over?
        draw? || won? || full?
    end

    def winner
        WIN_COMBINATIONS.each do |x| 
            if x.all? {|x| @board[x] == "X"}
                return "X"
            elsif
                x.all? {|x| @board[x] == "O"}
                return "O"
            elsif !won?
                return nil
            end
        end
    end

    def play 
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end