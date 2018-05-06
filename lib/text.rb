class Text 

    def welcome
        "\nWelcome to MASTERMIND\n\n\n"
    end
    
    def adjust
        "--------------------------------------------------------------------
please adjust your terminal width until there is 1 only line above\n\n\n"
    end

    def intro_choose
        puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
        response = gets.chomp.upcase
    end

    def instructions
         "\nA random sequence of color elements is generated at the 
beginning of the game. You must guess the correct sequence of colors
by entering the first letter of each color in a string like 'RGBY' 
for colors red green blue yellow. Depending on difficulty selected 
the answer will have a different length of characters and different 
number of colors to choose from. You can use any color any number of 
times as long as it meets the required length.\n\n"
    end
    
    def quit_game
        "\nQuitting game!\n\n"
    end

    def choose
        puts `clear`
        puts "Choose difficulty: (b)eginner, (i)ntermediate, or (a)dvanced?"
        char = gets.chomp.upcase
    end

    def cheater(answer)
        "\nYou cheater the answer is #{answer.join}\n\n"
    end

    def more_digits(answer)
        "\nNot enough digits. Please type #{answer.length} letters with no spaces.\n\n"
    end

    def less_digits(answer)
        "\nToo many digits. Please type #{answer.length} letters with no spaces.\n\n"
    end

    def guess_prompt
        puts "What's your guess?"
        guess = gets.chomp.upcase
    end

    def play_again
        puts "\nDo you want to (p)lay again or (q)uit?"
        response = gets.chomp.upcase
    end

    def difficulty_text(choice, difficulty, answer)
        rgby = "\nI generated a random #{difficulty} sequence with #{answer.length}
elements with possible colors (r)ed, (g)reen, (b)lue, (y)ellow."
        if choice == 'B'
            rgby
        elsif choice == 'I'
            rgby = "#{rgby}, and (p)urple."
        else
            rgby = "#{rgby} (p)urple, and (o)range"
        end
        "#{rgby}\nUse (q)uit at any time to end the game.\n\n"
    end

    def end_game(time_arr, answer, guesses)
        words = "\nCongratulations! You guessed the sequence '#{answer.join}' in #{guesses} guesses "
        if time_arr[0] < 60
            words = "#{words}\nover #{time_arr[0]} seconds.\n"
        else
            words = "#{words}\nover #{time_arr[1]} minutes, and #{time_arr[2]} seconds\n"
        end 
        words
    end

    def play_or_quit(choice)
        if choice == 'P'
            return
        elsif choice == 'Q'
            puts quit_game
            exit
        end
        play_or_quit(choice)
    end

    def how_many_right(guess, colors, correct)
        "'#{guess}' has #{colors} of the correct elements 
with #{correct} in the correct position.\n\n"
    end
end