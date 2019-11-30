class Room

attr_reader :name, :capacity, :till

 def initialize(name, capacity, till)
   @name = name
   @capacity = capacity
   @till = till
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

 def add_group(group)
  @group = group
end

 def get_playlist_number
   return @playlist.length
 end

 def check_empty
   return @group.length
 end

 def add_guest(guest)
   @group.push(guest)
 end

 def group_names
   return @group.map{ |name| name.name}
 end

 def checkout(guest_leaving)
   return @group.delete(guest_leaving)
 end

 def capacity_check(group)
   @group = group
   return true if @capacity >= @group.length
   return false
 end

 def purchase(price)
   @till += price
 end








end
