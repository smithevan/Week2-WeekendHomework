class Room

attr_reader :name, :till, :stock

 def initialize(name, till, stock)
   @name = name
   @till = till
   @drinks = []
   @stock = stock
 end

end 
