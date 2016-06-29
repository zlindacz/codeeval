File.open(ARGV[0]).each_line do |line|
  number = line.chomp.chars.reverse
  number_code = (('a'..'f').to_a.zip(10..15).to_a).to_h
  hash = {}
  number.each_with_index do |digit, idx|
    digit = ('a'..'f').include?(digit) ? number_code[digit] : digit.to_i
    hash[16**idx.to_i] = digit
  end
  result = []
  hash.each { |power, digit| result << (power * digit) }
  puts result.inject(:+)
end


# testing
def hex_to_dec(line)
  number = line.chars.reverse
  number_code = (('a'..'f').to_a.zip(10..15).to_a).to_h
  hash = {}
  number.each_with_index do |digit, idx|
    digit = ('a'..'f').include?(digit) ? number_code[digit] : digit.to_i
    hash[16**idx.to_i] = digit
  end
  result = []
  hash.each { |power, digit| result << (power * digit) }
  result.inject(:+)
end

puts hex_to_dec('5c')
puts hex_to_dec('8fd')