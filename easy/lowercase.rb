File.open(ARGV[0]).each_line do |line|
  puts line.split.map { |word| word.downcase }.join(' ')
end