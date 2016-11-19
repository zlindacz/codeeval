=begin
MERSENNE PRIME
CHALLENGE DESCRIPTION:

In January 2013, GIMPS contributors discovered the 48th known Mersenne prime number. For this, they received a $100,000 award. A newly announced $150,000 reward will be given to those who will discover the next largest known prime.
Do not want to get it? We offer this challenge to you to get ready.

INPUT SAMPLE:

The first argument is a path to a file. Each line includes a test case with an integer.

1
2
4
308
OUTPUT SAMPLE:

Your task is to print all Mersenne numbers that are smaller than the number in a test case. Separate those numbers by commas.

1
2
3
3, 7, 31, 127
CONSTRAINTS:

The number in a test case can be from 4 to 3,000.
The number of test cases is 20.
=end

# Mersenne numbers
mersenne = [3, 7, 31, 127, 2047]

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.to_i
  puts mersenne.select { |n| n < line }.join(', ')
end

# Mersenne primes
def prime?(number)
  (2...number).none? { |integer| number % integer == 0 }
end

def mersenne?(number)
  prime?(number) && (0..number).any? { |i| 2**i-1 == number }
end

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.to_i
  mersenne = []
  (3..line).each { |n| mersenne << n if mersenne?(n) }
  puts mersenne.join(', ')
end

# # slower, for some reason
# File.open(ARGV[0]).each_line do |line|
#   line = line.chomp.to_i
#   puts (3..line).select { |n| mersenne?(n) }.join(', ')
# end
