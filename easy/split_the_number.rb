File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split
  numbers = line[0]
  code = line[1]
  index_of_operation = /[\+-]/=~ code
  puts numbers[0...index_of_operation].to_i.send code[index_of_operation].to_sym, numbers[index_of_operation...numbers.length].to_i
end