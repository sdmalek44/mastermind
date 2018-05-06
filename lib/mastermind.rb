class Mastermind

    attr_accessor :difficulty,
                  :guesses,
                  :char,
                  :answer

    def initialize
        @char = []
        @answer = []
        @start_time = Time.now
        @difficulty = ""
        @guesses = 0
    end

    def start_game(char)
        @guesses = 0
        @start_time = Time.now
        @answer = []
        if char == 'B'
            @difficulty = 'beginner'
            @char = %w[R G B Y]
            4.times { @answer << @char.sample }
        elsif char == 'I'
            @difficulty = 'intermediate'
            @char = %w[R G B Y P]
            6.times { @answer << @char.sample }
        elsif char == 'A'
            @difficulty = 'advanced'
            @char = %w[R G B Y P O]
            8.times { @answer << @char.sample }       
        end
    end
    
    def color_match(input)
        match_num = 0
        @guesses += 1
        @char.each do |char|
            if (@answer.count(char) <= input.count(char))
                match_num += @answer.count(char)
            else
                match_num += input.count(char)
            end
        end
        match_num
    end

    def correct(input)
        input_arr = input.split(//)
        correct = 0
        input_arr.each_with_index do |val, index|
            if val == @answer[index]
                correct += 1
            end
        end
        correct
    end

    def finish_time
        @guesses += 1
        seconds = (Time.now - @start_time).to_i
        minutes = seconds / 60
        Array.new.push(seconds, minutes, (seconds - minutes * 60))
    end
end
