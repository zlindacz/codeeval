File.open(ARGV[0]).each_line do |line|
  puts line.chomp.split.map { |word| word[0].upcase + word[1...word.length] }.join(' ')
end