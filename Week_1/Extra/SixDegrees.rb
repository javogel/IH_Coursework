require 'pry'



class Parser
  attr_accessor :people_mentions, :first_degree, :second_degree, :third_degree

  def initialize
    @filename = "sample-input.txt"
    @conversations = []
    @people_mentions = {}
    @first_degree = {}
    @second_degree = {}
    @third_degree = {}

  end

  def read_conversations

    File.readlines(@filename).each do |line|

      current_line = line.to_s
      @conversations << current_line.split(" ")




    end
  end



  def calculate_second_degree
  end



  def add_people(person)

    if !@people_mentions.include?(person.to_sym)
      @people_mentions[person.to_sym] = []
      @first_degree[person.to_sym] = []
      @second_degree[person.to_sym] = []
      @third_degree[person.to_sym] = []
    end


  end



  def parse_text

    @conversations.each do |line|

      if line[0][-1]==":"
        add_people(line[0][0..-2])
      end

      line.each do |word|
          if word[0]=="@"
            # binding.pry
            mentioner_key = line[0][0..-2].to_sym
            mentioned_name = word[1..-1][/(\w+)/]

            # if @people_mentions[mentioner_key]
              # puts "\n"
              # puts @people_mentions
              @people_mentions[mentioner_key].push(mentioned_name)

              # puts "#{mentioner_key} mentioned #{mentioned_name}"
              # puts @people_mentions
              # puts "\n"


          end
      end

    end

  # binding.pry
    # @people_mentions.each do |speaker, text|
    #   text.each do |text|
    #     text
    #
    #   end
    # end

  end



  def calculate_first_degree

    @people_mentions.each do |mentioner, mentions|
        mentions.each do |name_mentioned|

            if !(@people_mentions[name_mentioned.to_sym] == nil) && (@people_mentions[name_mentioned.to_sym].include? mentioner.to_s)
              @first_degree[mentioner].push(name_mentioned)
            end

        end
    end
  end



  def calculate_second_degree

    @people_mentions.each do |mentioner, mentions|
        mentions.each do |name_mentioned|

            if !(@people_mentions[name_mentioned.to_sym].include? mentioner.to_s)
              @second_degree[mentioner].push(name_mentioned)

            end

        end
    end



    # @first_degree.each do |name, connections|
    #   connections.each do |connection|
    #     if !(@first_degree[connection.to_sym].include? name.to_s)
    #       @second_degree[name].push(connection)
    #
    #     end
    #
    #     puts @second_degree
    #   end
    # end

  end

end




parsy = Parser.new
parsy.read_conversations
parsy.parse_text
parsy.calculate_first_degree
# parsy.calculate_second_degree


puts parsy.first_degree
# puts parsy.second_degree
# puts  parsy.people_mentions
