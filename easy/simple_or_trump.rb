=begin
SIMPLE OR TRUMP
CHALLENGE DESCRIPTION:

First playing cards were invented in Eastern Asia and then spread all over the world taking different forms and appearance. In India, playing cards were round, and they were called Ganjifa. In medieval Japan, there was a popular Uta-garuta game, in which shell mussels were used instead of playing cards.
In our game, we use playing cards that are more familiar nowadays. The rules are also simple: an ace beats a deuce (2) unless it is a trump deuce.

INPUT SAMPLE:

The first argument is a path to a file. Each line includes a test case which contains two playing cards and a trump suit. Cards and a trump suite are separated by a pipeline (|). The card deck includes thirteen ranks (from a deuce to an ace) of each of the four suits: clubs (♣), diamonds (♦), hearts (♥), and spades (♠). There are no Jokers.

1
2
3
AD 2H | H
KD KH | C
JH 10S | C
OUTPUT SAMPLE:

Your task is to print a card that wins. If there is no trump card, then the higher card wins. If the cards are equal, then print both cards.

1
2
3
2H
KD KH
JH
CONSTRAINTS:

The card deck includes ranks from a deuce (2) to an ace, no Jokers.
If the cards are equal, then print both cards.
The number of test cases is 40.
=end

value_scale = ['2', '3', '4', '5', '6', '7', '8', '9', '1', 'J', 'Q', 'K', 'A']

def compare_suits(card1, card2, trump)
  if card1[-1] == trump && card2[-1] != trump
    [card1]
  elsif card1[-1] != trump && card2[-1] == trump
    [card2]
  else
    [card1, card2]
  end
end

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(' | ')
  cards = line[0].split(' ')
  card1, card2 = cards[0], cards[1]
  trump = line[1]
  result = []
  if compare_suits(card1, card2, trump).size == 2 # both have same suit
    if value_scale.index(card1[0]) > value_scale.index(card2[0])
      result << card1
    elsif value_scale.index(card1[0]) < value_scale.index(card2[0])
      result << card2
    else
      result << card1 << card2
    end
  else
    result << compare_suits(card1, card2, trump)
  end
  puts result.join(' ')
end


# doesn't take into account J, Q, K, and A values
# def compare_numbers(card1, card2)
#   card1 = convert_value(card1)
#   card2 = convert_value(card2)
#   if card1[0] > card2[0]
#     [card1]
#   elsif card1[0] < card2[0]
#     [card2]
#   else
#     [card1, card2]
#   end
# end

# File.open(ARGV[0]).each_line do |line|
#   line = line.chomp.split(' | ')
#   cards = line[0].split(' ')
#   trump = line[1]
#   if compare_suits(cards[0], cards[1], trump).size == 2
#     if compare_numbers(cards[0], cards[1]).size == 2
#       puts compare_numbers(cards[0], cards[1]).join(' ')
#     else
#       puts compare_numbers(cards[0], cards[1])
#     end
#   else
#     puts compare_suits(cards[0], cards[1], trump)
#   end
# end
