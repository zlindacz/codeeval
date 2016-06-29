def compare_bits(number, position1, position2)
  number = number.to_i.to_s(2)
  number[-(position1.to_i)] == number[-(position2.to_i)]
end

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(',')
  puts compare_bits(line[0], line[1], line[2])
end
