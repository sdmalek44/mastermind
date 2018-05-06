require './lib/mastermind'
require './lib/text'

text = Text.new
game = Mastermind.new

puts text.welcome
puts text.adjust

loop do
    response = text.intro_choose
    if response == 'P'
        break
    elsif response == 'I'
        puts text.instructions
    elsif response == 'Q'
        puts text.quit_game
        exit
    end
end

loop do
    loop do
        choice = text.choose
        if (choice == 'B') || (choice == 'I') || (choice == 'A')
            game.start_game(choice)
            puts text.difficulty_text(choice, game.difficulty, game.answer)
            break
        end
    end

    loop do
        guess = text.guess_prompt
        if guess == 'Q'
            puts text.quit_game
            exit
        elsif guess == 'C'
            puts text.cheater(game.answer)
        elsif guess.length < game.answer.length
            puts text.more_digits(game.answer)
        elsif guess.length > game.answer.length
            puts text.less_digits(game.answer)
        elsif guess == game.answer.join
            puts text.end_game(game.finish_time, game.answer, game.guesses)
            choice = text.play_again
            text.play_or_quit(choice)
            break
        else
            puts text.how_many_right(guess, game.color_match(guess), game.correct(guess))
        end
    end
end
