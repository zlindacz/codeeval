=begin
N MOD M
CHALLENGE DESCRIPTION:


Given two integers N and M, calculate N Mod M (without using any inbuilt modulus operator).

INPUT SAMPLE:

Your program should accept as its first argument a path to a filename. Each line in this file contains two comma separated positive integers. E.g.

20,6
2,3
You may assume M will never be zero.

OUTPUT SAMPLE:

Print out the value of N Mod M
=end

def mod_by(n,m)
  n-(n/m)*m
end

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(',')
  number = line[0].to_i
  mod_by = line[1].to_i
  puts mod_by(number, mod_by)
end

# trying for faster

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(',')
  number = line[0].to_i
  mod_by = line[1].to_i
  puts number-(number/mod_by)*mod_by
end
