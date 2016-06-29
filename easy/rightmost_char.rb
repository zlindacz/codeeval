File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(',')
  string = line[0]
  character = line[1]
  result = []
  index = string.reverse.index(character)
  result = index ? string.length - (index+1) : '-1'
  puts result
end

# old, before refactoring

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(',')
  string = line[0]
  character = line[1]
  result = []
  string.reverse.each_char.with_index do |letter, idx|
    if letter == character
      result << idx
      break
    end
  end
  if result.any?
    puts (string.length - (result[0]+1))
  else
    puts '-1'
  end
end

# codeeval doesn't support regexp =~, and some other quirkiness

File.open(ARGV[0]).each_line do |line|
  line = line.split(',')
  string = line[0]
  character = line[1]
  match = /#{character}/ =~ string.reverse
  if match.nil?
    puts '-1'
  else
    puts (string.length - (match+1))
  end
end

File.open(ARGV[0]).each_line do |line|
  line = line.split(',')
  string = line[0]
  character = line[1]
  match = Regexp.new("#{character}") =~ string.reverse
  if match.nil?
    puts '-1'
  else
    puts (string.length - (match+1))
  end
end