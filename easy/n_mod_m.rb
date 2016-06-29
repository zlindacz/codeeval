def mod_by(n,m)
  n-(n/m)*m
end

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(',')
  number = line[0].to_i
  mod_by = line[1].to_i
  puts mod_by(number, mod_by)
end

# trying for faster

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(',')
  number = line[0].to_i
  mod_by = line[1].to_i
  puts number-(number/mod_by)*mod_by
end