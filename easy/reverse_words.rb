File.open(ARGV[0]).each_line do |line|
  line = line.split.reverse.join(' ')
  puts line
end