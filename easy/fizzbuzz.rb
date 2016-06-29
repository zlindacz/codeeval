File.open(ARGV[0]).each_line do |line|
  line = line.split.map! { |num| num.to_i }
  (1..line[2]).each do |i|
    if i%line[0] == 0 && i%line[1] == 0
      print 'FB '
    elsif i%line[0] == 0
      print 'F '
    elsif i%line[1] == 0
      print 'B '
    else
      print "#{i} "
    end
  end
  puts "\n"
end