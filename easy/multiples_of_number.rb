=begin
MULTIPLES OF A NUMBER
CHALLENGE DESCRIPTION:

Given numbers x and n, where n is a power of 2, print out the smallest multiple of n which is greater than or equal to x. Do not use division or modulo operator.

INPUT SAMPLE:

The first argument will be a path to a filename containing a comma separated list of two integers, one list per line. E.g.

13,8
17,16
OUTPUT SAMPLE:

Print to stdout, the smallest multiple of n which is greater than or equal to x, one per line. E.g.

16
32
=end

def multiples_of(num1, m)
  m = m.to_i
  i = 1
  while true
    return i*m if i*m >= num1.to_i
    i += 1
  end
end

File.open(ARGV[0]).each_line do |line|
  line = line.split(',')

  puts multiples_of(line[0], line[1])
end
