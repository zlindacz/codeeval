CHECKPOINT = 'C'
GATE = '_'
OBSTRUCTION = '#'
STRAIGHT = '|'
RIGHT = '/'
LEFT = '\\'

prev_path = [nil]

File.open(ARGV[0]).each_line do |line|
  line = line.chomp

  prev_index = prev_path.first
  new_line = line.chars.map.with_index do |char, idx|
    if char == OBSTRUCTION
      OBSTRUCTION
    elsif char == GATE && line.include?(CHECKPOINT)
      GATE
    elsif char == GATE || char == CHECKPOINT
      if prev_index == nil || prev_index == idx
        char = STRAIGHT
      elsif prev_index > idx
        char = RIGHT
      else
        char = LEFT
      end
      prev_path << idx
      prev_path.shift
      char
    end
  end

  puts new_line.join
end


=begin
input:
#########_##
########C_##
#######_####
######_#C###
#######_C###
#######_####
######C#_###
######C_####
#######_####
#######_####

output:
#########|##
########/_##
#######/####
######_#\###
#######_|###
#######/####
######/#_###
######|_####
#######\####
#######|####
=end
