=begin
RIGHTMOST CHAR
CHALLENGE DESCRIPTION:

You are given a string 'S' and a character 't'. Print out the position of the rightmost occurrence of 't' (case matters) in 'S' or -1 if there is none. The position to be printed out is zero based.

INPUT SAMPLE:

The first argument will ba a path to a filename, containing a string and a character, comma delimited, one per line. Ignore all empty lines in the input file. E.g.
Hello World,r
Hello CodeEval,E
OUTPUT SAMPLE:

Print out the zero based position of the character 't' in string 'S', one per line. Do NOT print out empty lines between your output.
E.g.

8
10
=end

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
