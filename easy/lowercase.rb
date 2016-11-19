=begin
LOWERCASE
CHALLENGE DESCRIPTION:

Given a string write a program to convert it into lowercase.

INPUT SAMPLE:

The first argument will be a path to a filename containing sentences, one per line. You can assume all characters are from the english language. E.g.

HELLO CODEEVAL
This is some text
OUTPUT SAMPLE:

Print to stdout, the lowercase version of the sentence, each on a new line. E.g.

hello codeeval
this is some text
=end

File.open(ARGV[0]).each_line do |line|
  puts line.split.map { |word| word.downcase }.join(' ')
end
