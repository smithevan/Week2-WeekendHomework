class Room

attr_reader :name, :capacity

 def initialize(name, capacity)
   @name = name
   @capacity = capacity
 end

 def check_in(group)
   group_number = group.length
   return true if @capacity >= group_number
   return false
 end


end
