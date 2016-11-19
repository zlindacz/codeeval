=begin
CAPITALIZE WORDS
CHALLENGE DESCRIPTION:

Write a program which capitalizes the first letter of each word in a sentence.

INPUT SAMPLE:

Your program should accept as its first argument a path to a filename. Input example is the following

1
2
3
4
Hello world
javaScript language
a letter
1st thing
OUTPUT SAMPLE:

Print capitalized words in the following way.

1
2
3
4
Hello World
JavaScript Language
A Letter
1st Thing
=end

File.open(ARGV[0]).each_line do |line|
  puts line.chomp.split.map { |word| word[0].upcase + word[1...word.length] }.join(' ')
end
