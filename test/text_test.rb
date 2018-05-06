require 'minitest/autorun'
require 'minitest/pride'
require './lib/text'
require './lib/mastermind'

class TextTest < Minitest::Test

    def test_welcome
        text = Text.new
        assert_equal "\nWelcome to MASTERMIND\n\n\n", text.welcome
    end

    def test_instructions
        text = Text.new
        assert_equal "\nA random sequence of color elements is generated at the 
beginning of the game. You must guess the correct sequence of colors
by entering the first letter of each color in a string like 'RGBY' 
for colors red green blue yellow. Depending on difficulty selected 
the answer will have a different length of characters and different 
number of colors to choose from. You can use any color any number of 
times as long as it meets the required length.\n\n", text.instructions
    end
    
    def test_quit_game
        text = Text.new

        assert_equal "\nQuitting game!\n\n", text.quit_game
    end

    def test_cheater_more_and_less_digits
        text = Text.new
        game = Mastermind.new
        game.answer = %w[R G B Y]

        assert_equal "\nYou cheater the answer is RGBY\n\n", text.cheater(game.answer)

        assert_equal "\nNot enough digits. Please type 4 letters with no spaces.\n\n", text.more_digits(game.answer)

        assert_equal "\nToo many digits. Please type 4 letters with no spaces.\n\n", text.less_digits(game.answer)
    end

    def test_difficulty_text
        text = Text.new
        game = Mastermind.new
        game.answer = %w[R G B Y]
        game.difficulty = 'beginner'        

        assert_equal "\nI generated a random beginner sequence with 4
elements with possible colors (r)ed, (g)reen, (b)lue, (y)ellow.\nUse (q)uit at any time to end the game.\n\n", text.difficulty_text('B', game.difficulty, game.answer)

    end

    def test_end_game
        text = Text.new
        game = Mastermind.new
        time_arr = [30, 0, 0]
        game.answer = %w[R G B Y]
        game.guesses = 1

        assert_equal "\nCongratulations! You guessed the sequence 'RGBY' in 1 guesses \nover 30 seconds.\n", text.end_game(time_arr, game.answer, game.guesses)
    end
    
    def test_how_many_right
        text = Text.new
        game = Mastermind.new
        game.answer = %w[R G B B]
        game.char = %w[R G B Y]
        guess = 'RGBB'
        
        assert_equal "'RGBB' has 4 of the correct elements 
with 4 in the correct position.\n\n", text.how_many_right(guess, game.color_match(guess), game.correct(guess))
    end
end