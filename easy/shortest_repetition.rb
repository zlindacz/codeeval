def shortest_rep(arr)
  arr.uniq.length
end

# p shortest_rep('abcabcabcabc'.chars)

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.chars
  puts shortest_rep(line)
end


# silly attempts, not even sure what I was trying to do...

# def shortest_rep(arr)
#   arr.length.times do |i|
#     byebug
#     if arr[i+1...arr.length].include?(arr[0..i])
#       return i+1 
#     end
#   end
#   1
# end


# File.open(ARGV[0]).each_line do |line|
#   line = line.chomp.chars
#   hash = Hash.new(0)
#   temp = []
#   while line.any?
#     byebug
#     if temp.include? line.first
      
#       hash[temp.join] += 1
#       temp = []
#     else
#       temp << line.shift
#     end
#   end
#   if hash.empty?
#     puts 1
#   else
#     puts hash.min_by { |string, frequency| string.length }.first.length 
#   end
# end


# File.open(ARGV[0]).each_line do |line|
#   line = line.chomp.chars
#   hash = Hash.new(0)
#   line.each { |letter| hash[letter] += 1 }
#   puts (hash.values.inject(:+))/(hash.values.size)
# end