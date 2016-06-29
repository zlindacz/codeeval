File.open(ARGV[0]).each_line do |line|
  keys = ('a'..'j').to_a.zip(0..9).to_h
  line = line.chomp.chars.map do |el|
    el.to_i.to_s == el ? el : keys[el]
  end
  puts line.compact.empty? ? 'NONE' : line.join
end

# testing
# line = 'Xa,}A#5N}{xOBwYBHIlH,#W'