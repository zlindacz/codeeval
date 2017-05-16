=begin
DATA RECOVERY
CHALLENGE DESCRIPTION:

Your friends decided to make fun of you. They have installed a script on your computer which shuffled all words within a text. It is a joke, so they have left hints for each sentence. The hints will allow you to rebuild the data easily, but you need to find out how to use them.

Your task is to write a program which reconstructs each sentence out of a set of words and prints out the original sentences.

INPUT SAMPLE:

Your program should accept a path to a filename as its first argument. Each line is a test case which consists of a set of words and a sequence of numbers separated by a semicolon. The words within a set and the numbers within a sequence are separated by a single space.

For example:

2000 and was not However, implemented 1998 it until;9 8 3 4 1 5 7 2
programming first The language;3 2 1
programs Manchester The written ran Mark 1952 1 in Autocode from;6 2 1 7 5 3 11 4 8 9
OUTPUT SAMPLE:

Print out a reconstructed sentence for each test case, one per line.

For example:

However, it was not implemented until 1998 and 2000
The first programming language
The Manchester Mark 1 ran programs written in Autocode from 1952
CONSTRAINTS:

The number of test cases is in a range from 20 to 40.
The words consist of ASCII uppercase and lowercase letters, digits, and punctuation marks.
=end
File.open(ARGV[0]).each_line do |line|
  line = line.chomp
  raw = line.split(';')
  scrambled_words = raw[0].split(' ')
  indices = raw[1].split(' ').map { |digit| digit.to_i }
  ordered_words = Array.new(indices.size, '')

  # max of indices minus sum of listed indices
  missing_index = (1..scrambled_words.size).to_a.reduce(:+) - indices.reduce(:+)
  indices.push(missing_index)

  indices.each do |index|
    ordered_words[index] = scrambled_words.shift
  end
  puts ordered_words.join(' ')
end
