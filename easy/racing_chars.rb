=begin
RACING CHARS
CHALLENGE DESCRIPTION:

You are given a file where each line is a section of a race track with obstructions, gates, and checkpoints. Your task is to find a way to pass this track using the following information:

1. Each section contains either one single gate or one gate with a checkpoint.
2. You should drive only through gates or checkpoints.
3. You should drive through a checkpoint rather than a gate.
4. An obstruction is represented by a number sign "#".
5. A gate is represented by an underscore "_".
6. A checkpoint is represented by a letter C.

INPUT SAMPLE:

Your program should accept a path to a filename as its first argument. Each line of the file is a new section of a race track.

1
2
3
4
5
6
7
8
9
10
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
OUTPUT SAMPLE:

Print out the way of passing this race track starting from the first line in the file. Use a pipe "|" for the straight, use a slash "/" for the left turn, and use a backslash "\" for the right turn.

1
2
3
4
5
6
7
8
9
10
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
CONSTRAINTS:

The number of lines in a file is 50.
The width of a section is 12 characters.
=end

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
