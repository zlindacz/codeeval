=begin
SWAP CASE
CHALLENGE DESCRIPTION:


Write a program which swaps letters' case in a sentence. All non-letter characters should remain the same.

INPUT SAMPLE:

Your program should accept as its first argument a path to a filename. Input example is the following

Hello world!
JavaScript language 1.8
A letter
OUTPUT SAMPLE:

Print results in the following way.

hELLO WORLD!
jAVAsCRIPT LANGUAGE 1.8
a LETTER
=end

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split.map do |word|
    word.chars.map! { |letter| letter == letter.downcase ? letter.upcase : letter.downcase }.join
  end
  puts line.join(' ')
end
