class Bar

attr_reader :bar_name, :bar_till

 def initialize(bar_name, bar_till)
   @bar_name = bar_name
   @bar_till = bar_till
   @rooms = []
   @drinks = []
 end

 def add_rooms(rooms)
   @rooms = rooms
 end

 def add_drink(drink)
   @drinks.push(drink)
 end

end
