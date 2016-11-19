=begin
BEAUTIFUL STRINGS
CHALLENGE DESCRIPTION:

Credits: This problem appeared in the Facebook Hacker Cup 2013 Hackathon.

When John was a little kid he didn't have much to do. There was no internet, no Facebook, and no programs to hack on. So he did the only thing he could... he evaluated the beauty of strings in a quest to discover the most beautiful string in the world.

Given a string s, little Johnny defined the beauty of the string as the sum of the beauty of the letters in it. The beauty of each letter is an integer between 1 and 26, inclusive, and no two letters have the same beauty. Johnny doesn't care about whether letters are uppercase or lowercase, so that doesn't affect the beauty of a letter. (Uppercase 'F' is exactly as beautiful as lowercase 'f', for example.)

You're a student writing a report on the youth of this famous hacker. You found the string that Johnny considered most beautiful. What is the maximum possible beauty of this string?

INPUT SAMPLE:

Your program should accept as its first argument a path to a filename. Each line in this file has a sentence. E.g.

1
2
3
4
5
ABbCcc
Good luck in the Facebook Hacker Cup this year!
Ignore punctuation, please :)
Sometimes test cases are hard to make up.
So I just go consult Professor Dalves
OUTPUT SAMPLE:

Print out the maximum beauty for the string. E.g.

1
2
3
4
5
152
754
491
729
646
=end

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.downcase.chars.reject { |letter| !(('A'..'Z').to_a + ('a'..'z').to_a).include?(letter) }
  dictionary = Hash.new(0)
  line.each { |letter| dictionary[letter] += 1 }
  multiply = dictionary.select { |letter, count| count > 0 }.values.sort.reverse.zip(26.downto(26-dictionary.keys.size).to_a)
  puts multiply.map { |pair| pair.inject(:*) }.inject(:+)
end
