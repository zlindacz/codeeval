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