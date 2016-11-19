=begin
ARMSTRONG NUMBERS
CHALLENGE DESCRIPTION:

An Armstrong number is an n-digit number that is equal to the sum of the n'th powers of its digits. Determine if the input numbers are Armstrong numbers.

INPUT SAMPLE:

Your program should accept as its first argument a path to a filename. Each line in this file has a positive integer. E.g.

1
2
3
6
153
351
OUTPUT SAMPLE:

Print out True/False if the number is an Armstrong number or not. E.g.

1
2
3
True
True
False
=end

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
