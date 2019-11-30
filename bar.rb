class Bar

attr_reader :bar_name, :bar_till

 def initialize(bar_name, bar_till)
   @bar_name = bar_name
   @bar_till = bar_till
   @rooms = []
 end

 def add_rooms(rooms)
   @rooms = rooms
 end

end
