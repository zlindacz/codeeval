File.open(ARGV[0]).each_line do |line|
  line = line.chomp
  result = line.to_i == line.chars.map { |digit| (digit.to_i)**(line.length) }.inject(:+)
  puts result.to_s.capitalize
end

# true:
# '371'
# '6'
# '153'

# false:
# '351'
# '793'