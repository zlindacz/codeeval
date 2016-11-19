=begin
REVERSE WORDS
CHALLENGE DESCRIPTION:

Write a program which reverses the words in an input sentence.

INPUT SAMPLE:

The first argument is a file that contains multiple sentences, one per line. Empty lines are also possible.

For example:

1
2
Hello World
Hello CodeEval
OUTPUT SAMPLE:

Print to stdout each sentence with the reversed words in it, one per line. Empty lines in the input should be ignored. Ensure that there are no trailing empty spaces in each line you print.

For example:

1
2
World Hello
CodeEval Hello
=end

File.open(ARGV[0]).each_line do |line|
  puts line.split.reverse.join(' ')
end
