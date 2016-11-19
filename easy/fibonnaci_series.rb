=begin
FIBONACCI SERIES
CHALLENGE DESCRIPTION:

The Fibonacci series is defined as: F(0) = 0; F(1) = 1; F(n) = F(n–1) + F(n–2) when n>1. Given an integer n≥0, print out the F(n).

INPUT SAMPLE:

The first argument will be a path to a filename containing integer numbers, one per line. E.g.

5
12
OUTPUT SAMPLE:

Print to stdout, the fibonacci number, F(n). E.g.

5
144
=end

def fib(n)
  n = n.to_i
  base = [0,1]
  return base[n] if n < 2
  until base.size > n
    base << (base[-1] + base[-2])
  end
  base.last
end

File.open(ARGV[0]).each_line do |line|
  puts fib(line.chomp)
end
