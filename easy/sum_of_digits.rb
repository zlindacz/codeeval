=begin
SUM OF DIGITS
CHALLENGE DESCRIPTION:

Given a positive integer, find the sum of its constituent digits.

INPUT SAMPLE:

The first argument will be a path to a filename containing positive integers, one per line. E.g.

23
496
OUTPUT SAMPLE:

Print to stdout, the sum of the numbers that make up the integer, one per line. E.g.

5
19
=end

File.open(ARGV[0]).each_line do |line|
  puts line.chars.map { |num| num = num.to_i }.inject(:+)
end
