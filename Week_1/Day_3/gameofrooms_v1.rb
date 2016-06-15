require 'colorize'
require 'pry'
require 'json'

class Game

  def initialize(game_name)
    @game_name = game_name
    @levels = []
    @current_level = 0
    @inventory = []
    @file='persistence.txt'

    puts "Welcome to The Game of Rooms!".colorize(:yellow)
  end

  def add_room(room)
    @levels << room
  end

  def play
    still_playing = true

    #Run this loop while the user is still playing
    while still_playing == true
      puts "\n"
      puts (@levels[@current_level].room_description + @levels[@current_level].room_hint).colorize(:green)

      #print potential exits.
      print "Exits: "
      @levels[@current_level].room_exits.each do |x,y|
        print "#{x.to_sym}, "
      end

      # user is requested input
      print "\n>"
      player_input = gets.chomp
      split_input = player_input.split(" ")

      #Validate user inputs
      if player_input =="Exit" || player_input == "exit"
        puts "The game is over. Thank you for playing."
        still_playing = false
      elsif @levels[@current_level].room_exits.include? player_input.to_sym
        @current_level = @levels[@current_level].room_exits[player_input.to_sym]
        puts "\n"
      elsif split_input[0].downcase == "pick"
        pick_up(split_input[-1])
      elsif split_input[0].downcase == "drop"
        drop(split_input[-1])
      elsif player_input.downcase == "inventory"
        inventory
      elsif player_input.downcase == "save"
        save
      elsif player_input.downcase == "load"
        load
      else
        puts "Enter the right command, Fool!".colorize(:red)
      end

    end

  end

  #prints inventory
  def inventory
     puts "\nHere's what we have in inventory:"
     @inventory.each {|x| puts x}
     puts "\n"
  end

  #pick up object
  def pick_up(name_of_object)
    if @levels[@current_level].objects.include? name_of_object.downcase
      object = name_of_object.downcase
      @inventory << object
      puts "A #{object} has been picked up.\n"
    else
      puts "There was no #{object} to pick up here\n"
    end
  end

  #drop object
  def drop(name_of_object)
    object = name_of_object.downcase
    @inventory.delete(object)
    puts "A #{object.downcase} has been dropped\n"

  end

  #save current state fo the game
  def save
    open(@file, 'w') do |f|
      f << @current_level.to_s + "\n"
      f << @inventory.to_s + "\n"
    end
    puts "Your progress has been saved."

  end

  #load state fo the game
  def load
    lines = []
    File.readlines(@file).each do |line|
      lines << line
    end
    @current_page = lines[0].to_i
    @inventory = JSON.parse(lines[1])
    puts "You have loaded your last saved state"
  end


end


class Room
  attr_reader :room_description, :room_hint, :room_exits, :objects

  def initialize (room_description, room_hint, room_exits, objects = nil)
    @room_description = room_description
    @room_hint= room_hint
    @room_exits = room_exits
    @objects = objects
  end

end
#
# class Player
#   attr_reader :name
#
#   def initialize(name)
#     @name = name
#   end
#
# end



Game_of_Rooms = Game.new("Game of Rooms")

Game_of_Rooms.add_room(Room.new("You are in the first room. ", "You need to leave now! They are coming", {:N => 1}))
Game_of_Rooms.add_room(Room.new("You are suddenly in your home ", "You go back or forward, but there is a sword. Want to pick it up?", {:S => 0, :N => 2}, ["sword"]))
Game_of_Rooms.add_room(Room.new("You are in a blue room", "There is a sandwich and an apple", {:S => 1, :E => 3}, ["sandwich", "apple"]))
Game_of_Rooms.add_room(Room.new("You are an office type room ", "There is no one here, only a computer", {:N => 4, :W => 2, :S => 0}, ["computer"]))
Game_of_Rooms.add_room(Room.new("You are in a black room. ", "Weird room. There is a random pipe, a flex-capacitor, and a towel", {:N => 5, :S => 3}, ["pipe", "flex-capacitor" , "towel"]))

Game_of_Rooms.play
