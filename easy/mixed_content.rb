File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(',')
  numbers = []
  words = []
  line.each do |el|
    el.to_i.to_s == el ? numbers << el : words << el
  end
  if numbers.empty?
    puts words.join(',')
  elsif words.empty?
    puts numbers.join(',')
  else
    puts words.join(',') + '|' + numbers.join(',')
  end
end

# slower

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(',')
  numbers = line.select { |el| el.to_i.to_s == el }
  words = line.select { |el| !numbers.include?(el) }
  if numbers.empty?
    puts words.join(',')
  elsif words.empty?
    puts numbers.join(',')
  else
    puts words.join(',') + '|' + numbers.join(',')
  end
end