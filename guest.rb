class Guest

attr_reader :name, :wallet, :favourite_song 

 def initialize(name, wallet, favourite_song)
   @name = name
   @wallet = wallet
   @favourite_song = favourite_song
 end

 def entry_fee(entry_fee)
   @wallet -= entry_fee
 end

 def favourite_song(song)
   p "Whooo" if @favourite_song == song
 end


end
