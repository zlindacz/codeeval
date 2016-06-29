numbers = []
File.open(ARGV[0]).each_line do |line|
  numbers << line.chomp.to_i
end
puts numbers.inject(:+)