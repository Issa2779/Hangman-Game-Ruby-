require 'faker'

class Hangman

    attr_accessor :word, :puzzle, :used_letters, :guesses

    def initialize()

        @word = Faker::Creature::Animal.name.downcase.split('')
        @puzzle = []
        @used_letters = []
        @guesses = 10
        
        generate_stars(@word.length)
    end

    #check if the word's letter is equal to the user input
    def check_word(input)
    
        count = 0
        right = 0
        stop = 1
        @word.each do |letter|
    
            if letter == input
    
                @puzzle[count] = letter
                right = right + 1
            end
            count = count + 1
        end
        puts "#{right} letters is/are right!"
    
        if right == 0

            stop = remaining_left()
            return stop
        else
            return @puzzle
        end
    end
    
    #check if the word is fully guessed
    def puzzle_equal_word()
    
        if @word == @puzzle
    
            puts "\nYou guessed correct! The word is #{@puzzle.join()}"
            return true
        else

            return false
        end
    end

    #called when the player runs out of guesses
    def get_status()
    
        puts "You ran out of chances try again later!"
        puts "\nThe word is #{@word.join()}"
    end
    
    #checks if a previous letter has been inserted
    def used_letters(input)
    
        @used_letters.each do |letter|
    
            if letter == input

                puts 'Used letter'
                return false
            end
        end
    end

    #saves the used letters in an array
    def push_used_letters(input)
    
        @used_letters.push(input)
    end

    #Subtracts the number of chances the player has
    def remaining_left()
    
        puts "You have #{@guesses = @guesses - 1} chances left!"

        return @guesses
    end
    
    #generate stars depending on the length of the actual word
    def generate_stars(length)
    
        count = 0
        @word.each do |letter|
        
            if count != length
    
                if @word[count] == ' '
                    @puzzle.push(' ')
                else
                    @puzzle.push('*')
                end
            end
            count = count + 1
        end 
    end
end