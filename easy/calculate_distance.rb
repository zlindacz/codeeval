File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(/[^-\d]/)
  line.delete('')
  x1 = line[0].to_i
  x2 = line[2].to_i
  y1 = line[1].to_i
  y2 = line[3].to_i
  puts "%.0f" % (((x1-x2)**2 + (y1-y2)**2)**(0.5))
end