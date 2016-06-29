File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(',')
  l = line.size
  major = Hash.new(0)
  line.each { |num| major[num] += 1 }
  max = major.select {|k, v| v > l/2 }
  puts max.empty? ? 'None' : max.keys
end

=begin
# too slow
File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(',')
  major = line.select { |num| line.count(num) > line.size/2 }
  puts major.empty? ? 'None' : major.first
end
=end