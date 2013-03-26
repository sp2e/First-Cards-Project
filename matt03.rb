=begin
The first Ruby Quiz (http://www.rubyquiz.com/quiz1.html) has you implement
Bruce Schneier's Solitaire cipher in Ruby. This hand cipher uses a standard
deck of cards as the encryption key as well as to perform the cipher operations.
Today's exercise is to implement a Deck class representing a physical deck of
cards. It should have the following properties:
It contains an ordered list of 54 cards: numbered 2..10, face cards JQKA, and 2 differentiable jokers
A specific order can be specified when the deck is created
Cards have numeric values:
Clubs A2..10JQK: 1-13
Diamonds A2..10JQK: 14-26
Hearts A2..10JQK: 27-39
Spades A2..10JQK: 40-52
Jokers: 53
It can be shuffled to randomly order the cards
It has methods to determine if a card is:
a particular suit
>, ==, or < a particular value
a face card
a joker
It has methods to
shift cards up or down in the deck, wrapping if necessary
perform a triple cut (see Ruby Quiz)
=end

SUIT_CODES = {
  "c" => 0,
  "d" => 1,  
  "h" => 2,
  "s" => 3     
}

NUM_CODES = {
  'A' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'T' => 10,
  'J' => 11,
  'Q' => 12,
  'K' => 13,
  '10' => 10,
  '11' => 11,
  '12' => 12,
  '13' => 13,
  '14' => 14,
  "JOKER" => 14
}

T = "T"
J = "J"
Q = "Q"
K = "K"
A = "A"
Joker = 53

class Card 
=begin  attr_reader :suit, :value
=end
  include Comparable
  attr_reader :card
  
  def initialize(card)  #card : "cA", "c2", etc 
    #..use "joker", or "jo",  (can be capitalized)
    if card[0].upcase == "J"
      @card = Joker
    else
      @card = SUIT_CODES[card[0]]*13 + NUM_CODES[card[1]]
    end
  end

  def suit?(suit) #is suit of card equal to a particular suit?
    (@card < Joker) and (
      (@card  - 1)/13 == SUIT_CODES[suit]  
      ) 
    #card values start at 1
    # dont need "float(...)" assuming everything is an integer
  end

  def <=> (value) #compare against actual value stored
    @card <=> value 
  end

  def val?(num)  #is card designation  (A, 2, 3..K  , Joker == num ?
       #num can be number or string: 2..9, "T"..."K","A","JOKER", "joker"
    if @card==Joker
      "JOKER"==[num.to_s.upcase] 
    else
      (@card - 1).remainder(13) + 1 == NUM_CODES[num.to_s.upcase] 
    end
  end

  def >(num) # is the card's value greater than a particular value
    if @card == Joker 
       14 > NUM_CODES[num.to_s]
    else
       (@card-1).remainder(13) + 1 > NUM_CODES[num.to_s.upcase] 
    end
  end

  def <(num) # is the card's value less than a particular value
    if @card == Joker 
       false
       # < NUM_CODES[face_num.to_s.capitalize]
    else
       (@card-1).remainder(13) + 1 < NUM_CODES[num.to_s.upcase] 
    end 
    #(@card -1 ).remainder(13) < NUM_CODES[face_num.to_s.capitalize]  - 1
  end 

  def face_cards?
    (10..12)   ===  (@card-1).remainder(13)
    # note : range has to be on left side of === 
  end

  def joker?
    Joker == @card 
  end

  def number  #returns "A", "2",...."K"
    if @card == Joker
      return "Joker"
    else
      NUM_CODES.key( (@card-1).remainder(13) + 1 )
    end
  end

  def suit  #returns "c" or :c ?   ,  etc
    if @card == Joker
      return "Joker"
    else
      SUIT_CODES.key( (@card-1)/13 )
    end
  end  
end

#below for cards directly represented by numbers
class Deck #parameter designationnot needed, initialize provides for it!
  attr_accessor  :card_order  #need symbol here probably...continure from here

  def initialize(card_order)
    @card_order = card_order
  end 

  def shuffle
    @card_order.shuffle!
  end 

  def cut3
    #triple cut: each cut has to be at least three cards.

    #returns 0 to 44 random number...dont cut 1st or last 3 cards, and leave 3 for middle    
    a = rand(45) + 6

    b = rand(a-5) + 3 

    #@card_order is left with what becomes the top of the deck (it was the bottom of the original deck)
    c = @card_order.shift(a)

    # d becomes the bottom of the deck (it was the top of the original deck)
    d = c.shift(b)

    @card_order =  @card_order + c + d
  end  

  def view_cards
    @card_order.each { |c|
       (c.joker?) ? (puts "#{c.suit}" ): (puts "#{c.suit}#{c.number}")
       #puts "#{c.suit}"
    }    
  end

  def wrap_first(a)
    @card_order += @card_order.shift(a)
  end

  def wrap_last(a)
    @card_order = @card_order.pop(a) + @card_order
  end  

end 






