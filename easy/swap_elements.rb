File.open(ARGV[0]).each_line do |line|
  num_arr = line.split(':')[0].split
  swaps = line.split(':')[1].split(', ')
  swaps.each do |swap|
    swap = swap.split('-').map(&:to_i)
    num_arr[swap.first], num_arr[swap.last] = num_arr[swap.last], num_arr[swap.first]
  end
  puts num_arr.join(' ')
end