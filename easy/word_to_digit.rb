numbers_in_words = { "zero" => 0, "one" => 1, "two" => 2,
                    "three" => 3, "four" => 4, "five" => 5,
                    "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9 }
                    
File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(';')
  puts line.map { |num| numbers_in_words[num] }.join
end