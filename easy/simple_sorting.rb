File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split.map! { |num| num.to_f }.sort
  puts line.map! { |num| sprintf "%.3f", num }.join(' ')
end