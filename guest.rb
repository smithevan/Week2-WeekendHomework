class Guest

attr_reader :name, :wallet

 def initialize(name, wallet)
   @name = name
   @wallet = wallet
 end

 def entry_fee(entry_fee)
   @wallet -= entry_fee
 end


end
