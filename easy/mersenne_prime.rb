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