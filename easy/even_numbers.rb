File.open(ARGV[0]).each_line do |line|
  line = line.chomp.to_i
  if line.even?
    puts 1
  else
    puts 0
  end
end