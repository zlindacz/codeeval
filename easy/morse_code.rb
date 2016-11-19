=begin
MORSE CODE
CHALLENGE DESCRIPTION:


You have received a text encoded with Morse code and want to decode it.

INPUT SAMPLE:

Your program should accept as its first argument a path to a filename. Input example is the following:

.- ...- ..--- .-- .... .. . -.-. -..-  ....- .....
-... .... ...--
Each letter is separated by space char, each word is separated by 2 space chars.

OUTPUT SAMPLE:

Print out decoded words. E.g.

AV2WHIECX 45
BH3
You program has to support letters and digits only.
=end

morse_code = {".-"=>"A", "-..."=>"B", "-.-."=>"C", "-.."=>"D", "."=>"E", "..-."=>"F",
              "--."=>"G", "...."=>"H", ".."=>"I", ".---"=>"J", "-.-"=>"K", ".-.."=>"L",
              "--"=>"M", "-."=>"N", "---"=>"O", ".--."=>"P", "--.-"=>"Q", ".-."=>"R",
              "..."=>"S", "-"=>"T", "..-"=>"U", "...-"=>"V", ".--"=>"W", "-..-"=>"X",
              "-.--"=>"Y", "--.."=>"Z", "-----"=>"0", ".----"=>"1", "..---"=>"2",
              "...--"=>"3", "....-"=>"4", "....."=>"5", "-...."=>"6", "--..."=>"7",
              "---.."=>"8", "----."=>"9"}

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split('  ')
  new_line = line.map do |word|
    word.split(' ').map! { |letter| letter = morse_code[letter] }.join
  end
  puts new_line.join(' ')
end

# test
# line = '.- ...- ..--- .-- .... .. . -.-. -..-  ....- .....'
