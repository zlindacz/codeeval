File.open(ARGV[0]).each_line do |line|
  puts line.chomp.split.reverse[1]
end