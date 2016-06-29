def largest_prime_palindrome
  1000.downto(2).each do |i|
    return i if prime?(i) && i.to_s == i.to_s.reverse
  end
end

def prime?(n)
  (2...n).to_a.none? { |integer| n % integer == 0 }
end

puts largest_prime_palindrome