File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split('; ').map {|pair| pair.split(',')}.to_h
  differences = []
  distances = line.values.map(&:to_i).sort.unshift(0)
  distances.each_with_index do |distance, idx|
    differences << (distance.to_i - distances[idx-1].to_i) if idx != 0
  end
  puts differences.join(',')
end

=begin
# old
File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split('; ').map {|pair| pair.split(',')}.to_h
  distances = line.sort_by { |town, distance| distance }.to_h.values
  byebug
  differences = []
  distances.unshift('0').each_with_index do |distance, idx|
    if idx != 0
      differences << (distance.to_i - distances[idx-1].to_i)
    end
  end
  puts differences.join(',')
end
=end