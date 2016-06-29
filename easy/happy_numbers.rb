def sum_of_digits(number)
  number.to_s.chars.map {|i| i.to_i**2 }.inject(:+)
end

def happy?(number, repository)
  if sum_of_digits(number) == 1
    return 1
  elsif repository.size > 20 || repository.include?(sum_of_digits(number))
    return 0
  else
    repository << sum_of_digits(number)
    number = sum_of_digits(number)
    happy?(number, repository)
  end
end

File.open(ARGV[0]).each_line do |line|
  number = line.chomp
  not_happy = []
  puts happy?(number, not_happy)
end