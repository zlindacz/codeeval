=begin
EVEN NUMBERS
CHALLENGE DESCRIPTION:

Write a program which checks input numbers and determines whether a number is even or not.

INPUT SAMPLE:

Your program should accept as its first argument a path to a filename. Input example is the following

1
2
3
701
4123
2936
OUTPUT SAMPLE:

Print 1 if the number is even or 0 if the number is odd.

1
2
3
0
0
1
All numbers in input are integers > 0 and < 5000.
=end

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.to_i
  if line.even?
    puts 1
  else
    puts 0
  end
end
