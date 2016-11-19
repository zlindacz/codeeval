=begin
BIT POSITIONS
CHALLENGE DESCRIPTION:

Given a number n and two integers p1,p2 determine if the bits in position p1 and p2 are the same or not. Positions p1 and p2 are 1 based.

INPUT SAMPLE:

The first argument will be a path to a filename containing a comma separated list of 3 integers, one list per line. E.g.

1
2
86,2,3
125,1,2
OUTPUT SAMPLE:

Print to stdout, 'true'(lowercase) if the bits are the same, else 'false'(lowercase). E.g.

1
2
true
false

=end

def compare_bits(number, position1, position2)
  number = number.to_i.to_s(2)
  number[-(position1.to_i)] == number[-(position2.to_i)]
end

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(',')
  puts compare_bits(line[0], line[1], line[2])
end
