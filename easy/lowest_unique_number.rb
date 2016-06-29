File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split
  numbers_hash = Hash.new(0)
  line.each_with_index { |num, idx| numbers_hash[idx] = num.to_i }
  uniq_numbers = numbers_hash.select { |idx, num| numbers_hash.values.count(num) == 1 }
  puts uniq_numbers.min_by { |idx, num| num }.first + 1 || 0
end