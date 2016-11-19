=begin
SHORTEST REPETITION
CHALLENGE DESCRIPTION:


Write a program to determine the shortest repetition in a string.
A string is said to have period p if it can be formed by concatenating one or more repetitions of another string of length p. For example, the string "xyzxyzxyzxyz" has period 3, since it is formed by 4 repetitions of the string "xyz". It also has periods 6 (two repetitions of "xyzxyz") and 12 (one repetition of "xyzxyzxyzxyz").

INPUT SAMPLE:

Your program should accept as its first argument a path to a filename. Each line will contain a string of up to 80 non-blank characters. E.g.

abcabcabcabc
bcbcbcbcbcbcbcbcbcbcbcbcbcbc
dddddddddddddddddddd
adcdefg
OUTPUT SAMPLE:

Print out the smallest period of the input string. E.g.

3
2
1
7
=end

def shortest_rep(arr)
  arr.uniq.length
end

# p shortest_rep('abcabcabcabc'.chars)

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.chars
  puts shortest_rep(line)
end


# silly attempts, not even sure what I was trying to do...

# def shortest_rep(arr)
#   arr.length.times do |i|
#     byebug
#     if arr[i+1...arr.length].include?(arr[0..i])
#       return i+1
#     end
#   end
#   1
# end


# File.open(ARGV[0]).each_line do |line|
#   line = line.chomp.chars
#   hash = Hash.new(0)
#   temp = []
#   while line.any?
#     byebug
#     if temp.include? line.first

#       hash[temp.join] += 1
#       temp = []
#     else
#       temp << line.shift
#     end
#   end
#   if hash.empty?
#     puts 1
#   else
#     puts hash.min_by { |string, frequency| string.length }.first.length
#   end
# end


# File.open(ARGV[0]).each_line do |line|
#   line = line.chomp.chars
#   hash = Hash.new(0)
#   line.each { |letter| hash[letter] += 1 }
#   puts (hash.values.inject(:+))/(hash.values.size)
# end
