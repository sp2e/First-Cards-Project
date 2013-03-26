
@card=[] # necessary for @card[x] to work in loop
x=0
%w{c d h s}.each do |s|
	%w{A 2 3 4 5 6 7 8 9 T J Q K}.each do |n|
	  @card[x] = Card.new(s+n)
	  puts "#{@card[x]}"
	  x +=1
	end  
end	
@card[Joker-1] = Card.new("joker")
@card[Joker] = Card.new("joker")

ary=[]
0.upto(53) do |x|
  ary << @card[x]
end
@shuf = Deck.new(ary)
