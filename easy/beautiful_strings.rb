File.open(ARGV[0]).each_line do |line|
  line = line.chomp.downcase.chars.reject { |letter| !(('A'..'Z').to_a + ('a'..'z').to_a).include?(letter) }
  dictionary = Hash.new(0)
  line.each { |letter| dictionary[letter] += 1 }
  multiply = dictionary.select { |letter, count| count > 0 }.values.sort.reverse.zip(26.downto(26-dictionary.keys.size).to_a)
  puts multiply.map { |pair| pair.inject(:*) }.inject(:+)
end