File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split.chunk_while { |i, j| i == j }
  puts line.map { |arr| [arr.size, arr[-1]] }.flatten.join(' ')
end