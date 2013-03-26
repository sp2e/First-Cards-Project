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