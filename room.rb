class Room

attr_reader :name, :capacity

 def initialize(name, capacity)
   @name = name
   @capacity = capacity
   @group = []
   @playlist = []
 end

 def get_group_number
   return @group.length
 end

 def add_song(song)
   @playlist.push(song)
 end

 def add_playlist(playlist)
   @playlist = playlist
 end

 def get_playlist_number
   return @playlist.length
 end

 def check_empty
   return @group.length
 end

 def capacity_check(group)
   @group = group
   return true if @capacity >= @group.length
   return false
 end



 def add_guest(guest)
   @group.push(guest)
 end


end
