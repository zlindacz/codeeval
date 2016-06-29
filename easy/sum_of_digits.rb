File.open(ARGV[0]).each_line do |line|
  puts line.chars.map { |num| num = num.to_i }.inject(:+)
end