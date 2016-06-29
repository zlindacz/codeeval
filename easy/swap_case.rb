File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split.map do |word|
    word.chars.map! { |letter| letter == letter.downcase ? letter.upcase : letter.downcase }.join
  end
  puts line.join(' ')
end