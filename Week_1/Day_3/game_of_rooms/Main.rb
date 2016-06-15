require 'colorize'
require 'pry'
require 'json'
require_relative 'Game'
require_relative 'Room'




Game_of_Rooms = Game.new("Game of Rooms")

Game_of_Rooms.add_room(Room.new("You are in the first room. ", "You need to leave now! They are coming.", {:N => 1}))
Game_of_Rooms.add_room(Room.new("You are suddenly in your home. ", "You go back or forward, but there is a sword. Want to pick it up?", {:S => 0, :N => 2}, ["sword"]))
Game_of_Rooms.add_room(Room.new("You are in a blue room. ", "There is a sandwich and an apple.", {:S => 1, :E => 3}, ["sandwich", "apple"]))
Game_of_Rooms.add_room(Room.new("You are an office type room. ", "There is no one here, only a computer.", {:N => 4, :W => 2, :S => 0}, ["computer"]))
Game_of_Rooms.add_room(Room.new("You are in a black room. ", "Weird room. There is a random pipe, a flex-capacitor, and a towel.", {:N => 5, :S => 3}, ["pipe", "flex-capacitor" , "towel"]))

Game_of_Rooms.play
