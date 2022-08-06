require_relative 'hangman-gameClass'

puts "\nWelcome to the Hangman Game\nLet's Begin:"
puts "\nGuess a letter: "

game1 = Hangman.new()

puts "#{game1.word.join()}"

loop do 

    puts "\n#{game1.puzzle.join()}"
    puts

    input = gets.chomp
    check_letter = game1.used_letters(input.downcase)

    if check_letter == false

    else
        puzzle = game1.check_word(input.downcase)
        complete = game1.puzzle_equal_word()

        if complete 
            break

        elsif puzzle == 0

            game1.get_status()
            break
        end

    end
    game1.push_used_letters(input.downcase)
end