require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

class MastermindTest < Minitest::Test 

    def test_if_it_exists
        game = Mastermind.new
        assert_instance_of Mastermind, game
    end

    def test_start_game
        game = Mastermind.new
        game.start_game('B')
        assert_equal 'beginner', game.difficulty
        assert_equal %w[R G B Y], game.char
        assert_equal 4, game.answer.length

        game.start_game('I')
        assert_equal 'intermediate', game.difficulty
        assert_equal %w[R G B Y P], game.char
        assert_equal 6, game.answer.length

        game.start_game('A')
        assert_equal 'advanced', game.difficulty
        assert_equal %w[R G B Y P O], game.char
        assert_equal 8, game.answer.length
    end

    def test_color_match
        game = Mastermind.new
        game.char = %w[R G B Y]
        game.answer = %w[G R B B]

        assert_equal 0, game.color_match('YYYY')
        assert_equal 3, game.color_match('RGBY')
        assert_equal 4, game.color_match('BBRG')
        assert_equal 3, game.guesses

        game.char = %w[R G B Y P]
        game.answer = %w[R R B Y P P]

        assert_equal 0, game.color_match('GGGGGG')
        assert_equal 3, game.color_match('YPYYBB')
        assert_equal 6, game.color_match('PPYBRR')

        game.char = %w[R G B Y P O]
        game.answer = %w[G R R Y P P O O]

        assert_equal 0, game.color_match('BBBBBBBB')
        assert_equal 8, game.color_match('OOPPYRRG')
    end

    def test_correct
        game = Mastermind.new
        game.answer = %w[R G B B]

        assert_equal 0, game.correct('BBGR')
        assert_equal 4, game.correct('RGBB')

        game.answer = %w[R G B Y P P]
        
        assert_equal 0, game.correct('PYPGRG')
        assert_equal 3, game.correct('PGGYRP')

        game.answer = %w[P P Y G B O R Y]

        assert_equal 3, game.correct('YPPOBGYY')
        assert_equal 8, game.correct('PPYGBORY')
    end

    def test_finish_time
        game = Mastermind.new
        assert_equal 0, game.guesses

        assert_equal 3, game.finish_time.length
        assert_equal 1, game.guesses
    end
end