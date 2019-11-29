class Room

attr_reader :name, :capacity

 def initialize(name, capacity)
   @name = name
   @capacity = capacity
   @group = []
   @playlist = []
 end

 def check_in(group)
   @group = group
   return true if @capacity >= @group.length
   return false
 end

 def add_song(song)
   @playlist.push(song)
 end


end
