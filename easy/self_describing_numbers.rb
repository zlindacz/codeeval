def self_describing?(number)
  frequency = Hash.new(0)
  place = Hash.new(0)
  number.to_s.chars.each_with_index do |digit, idx|
    frequency[digit.to_i] += 1
    place[idx] += digit.to_i
  end
  place.select { |position, value| value > 0 }.sort == frequency.sort ? 1 : 0
end

# puts self_describing?(2020)
# puts self_describing?(22)
# puts self_describing?(1210)

File.open(ARGV[0]).each_line do |line|
  number = line.chomp.to_i
  puts self_describing?(number)
end