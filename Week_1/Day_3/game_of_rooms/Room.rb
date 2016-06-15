class Room
  attr_reader :room_description, :room_hint, :room_exits, :objects

  def initialize (room_description, room_hint, room_exits, objects = nil)
    @room_description = room_description
    @room_hint= room_hint
    @room_exits = room_exits
    @objects = objects
  end

end
