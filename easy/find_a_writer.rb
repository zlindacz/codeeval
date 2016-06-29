File.open(ARGV[0]).each_line do |line|
  jumble = line.split('|').first.chars
  keys = line.split('|').last.strip.split.map! { |key| key = key.to_i }
  author = ''
  keys.each { |key| author += jumble[key-1] }
  puts author
end