=begin
MIXED CONTENT
CHALLENGE DESCRIPTION:


You have a string of words and digits divided by comma. Write a program which separates words with digits. You shouldn't change the order elements.

INPUT SAMPLE:

Your program should accept as its first argument a path to a filename. Input example is the following

8,33,21,0,16,50,37,0,melon,7,apricot,peach,pineapple,17,21
24,13,14,43,41
OUTPUT SAMPLE:

melon,apricot,peach,pineapple|8,33,21,0,16,50,37,0,7,17,21
24,13,14,43,41
As you cas see you need to output the same input string if it has words only or digits only.
=end

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(',')
  numbers = []
  words = []
  line.each do |el|
    el.to_i.to_s == el ? numbers << el : words << el
  end
  if numbers.empty?
    puts words.join(',')
  elsif words.empty?
    puts numbers.join(',')
  else
    puts words.join(',') + '|' + numbers.join(',')
  end
end

# slower

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(',')
  numbers = line.select { |el| el.to_i.to_s == el }
  words = line.select { |el| !numbers.include?(el) }
  if numbers.empty?
    puts words.join(',')
  elsif words.empty?
    puts numbers.join(',')
  else
    puts words.join(',') + '|' + numbers.join(',')
  end
end
