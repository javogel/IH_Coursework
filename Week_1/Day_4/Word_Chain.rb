require 'ruby-dictionary'
require 'pry'

class WordChain
    def initialize(dictionary)
        @dictionary = dictionary
    end

    def find_chain(word1, word2)
        # Write your algorithm here
        word1_split = word1.split("")
        word2_split = word2.split("")
        test_word = []
        word_list = [word1]

      while test_word.join("") != word2

        word1_split.each_index do |x|
          test_word = word_list[-1].split("")

          if !(test_word[x] == word2_split[x])
            test_word[x] = word2_split[x]

              if @dictionary.exists? test_word.join("")

                # if !(word_list.include? test_word.join(""))
                    word_list << test_word.join("")
                # end

              end

              return puts word_list if test_word.join("") == word2
          end

        end


      end




    end
end


dictionary = Dictionary.from_file("/usr/share/dict/words")
my_chain = WordChain.new(dictionary)
my_chain.find_chain("lead", "gold")
