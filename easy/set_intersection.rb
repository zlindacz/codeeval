File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(';')
  set1 = line[0].split(',').map! { |str| str.to_i }
  set2 = line[1].split(',').map! { |str| str.to_i }
  puts (set1 & set2).join(',')
end