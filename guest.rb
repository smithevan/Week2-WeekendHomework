class Guest

attr_reader :name, :wallet, :favourite_song

 def initialize(name, wallet, favourite_song)
   @name = name
   @wallet = wallet
   @favourite_song = favourite_song
   @drinks = []
 end

 def entry_fee(entry_fee)
   @wallet -= entry_fee
 end

 def favourite_song(song)
   p "Whooo" if @favourite_song == song
 end

 def take_drink(drink)
   @drinks.push(drink)
 end

 def drink_charge(name, price)
  return @wallet -= price if name = @name || if name == nil
 end
 
 end

end
