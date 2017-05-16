File.open(ARGV[0]).each_line do |line|
  line = line.chomp
  letters_in_ascii = line.chars.map { |letter| letter.ord }

  # A-Z: 65-90; a-z: 97-122

  # if inputs are guaranteed to only be letters, then checks not nec.
  lower_case_count = 0
  letters_in_ascii.each do |code|
    lower_case_count += 1 if code > 90
  end

  lower_case_percentage = (lower_case_count / letters_in_ascii.length.to_f) * 100.0
  upper_case_percentage = 100.0 - lower_case_percentage

  puts "lowercase: #{'%.2f' % lower_case_percentage} uppercase: #{'%.2f' % upper_case_percentage}"
end
