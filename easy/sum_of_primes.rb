def sum_of_primes(n)
  primes = []
  i = 2
  until primes.size == n
    primes << i if prime?(i)
    i += 1
  end
  primes.inject(:+)
end

def prime?(n)
  (2...n).to_a.none? { |integer| n % integer == 0 }
end

puts sum_of_primes(1000)