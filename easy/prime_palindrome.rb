=begin
PRIME PALINDROME
CHALLENGE DESCRIPTION:


Write a program which determines the largest prime palindrome less than 1000.

INPUT SAMPLE:

There is no input for this program.

OUTPUT SAMPLE:

Print to stdout the largest prime palindrome less than 1000.

929
=end

def largest_prime_palindrome
  1000.downto(2).each do |i|
    return i if prime?(i) && i.to_s == i.to_s.reverse
  end
end

def prime?(n)
  (2...n).to_a.none? { |integer| n % integer == 0 }
end

puts largest_prime_palindrome
