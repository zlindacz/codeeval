File.open(ARGV[0]).each_line do |line|
  arr1 = line.split('|')[0].split.map(&:to_i)
  arr2 = line.split('|')[1].split.map(&:to_i)
  puts arr1.zip(arr2).map { |pair| pair.inject(:*) }.join(' ')
end