class Bar

attr_reader :bar_name, :bar_till

 def initialize(bar_name, bar_till)
   @bar_name = bar_name
   @bar_till = bar_till
   @rooms = []
   @drinks = []
   @tab = []
 end

 def rooms_in_bar
   @rooms.length
 end

 def add_rooms(room)
   @rooms.push(room)
 end

 def add_drink(drink)
   @drinks.push(drink)
 end

 def get_drinks
   @drinks
 end

 def remove_drink(drink)
   @drinks.delete(drink)
   return @drinks
 end

 def drink_count
   @drinks.length
 end

 def make_sale(item_sold)
   @bar_till += item_sold
 end

 def run_tab(drink_price, customer_name)
   @tab.push ({'name' => customer_name, 'tab' => drink_price})
  # @tab.push(customer_name[:name], drink_price[:price])
 end

end
