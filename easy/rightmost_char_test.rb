require 'byebug'

File.open('rightmost_char.txt').each_line do |line|
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