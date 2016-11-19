=begin
QUERY BOARD
CHALLENGE DESCRIPTION:

There is a board (matrix). Every cell of the board contains one integer, which is 0 initially.

The next operations can be applied to the Query Board:
SetRow i x: it means that all values in the cells on row "i" have been changed to value "x" after this operation.
SetCol j x: it means that all values in the cells on column "j" have been changed to value "x" after this operation.
QueryRow i: it means that you should output the sum of values on row "i".
QueryCol j: it means that you should output the sum of values on column "j".

The board's dimensions are 256x256
"i" and "j" are integers from 0 to 255
"x" is an integer from 0 to 31
INPUT SAMPLE:

Your program should accept as its first argument a path to a filename. Each line in this file contains an operation of a query. E.g.

SetCol 32 20
SetRow 15 7
SetRow 16 31
QueryCol 32
SetCol 2 14
QueryRow 10
SetCol 14 0
QueryRow 15
SetRow 10 1
QueryCol 2
OUTPUT SAMPLE:

For each query, output the answer of the query. E.g.

5118
34
1792
3571
=end

board = Array.new(256) { Array.new(256) { 0 } }

def set_row!(board, row, value)
  board[row].map! { |position| position = value }
end

def set_column!(board, column, value)
  board.each { |row| row[column] = value }
end

def query_row(board, row)
  board[row].inject(:+)
end

def query_column(board, column)
  sum = []
  board.each { |row| sum << row[column] }
  sum.inject(:+)
end

def execute_command(command, board, row_column, position_value)
  if command == 'SetRow'
    set_row!(board, row_column, position_value)
    "\n"
  elsif command == 'SetCol'
    set_column!(board, row_column, position_value)
    "\n"
  elsif command == 'QueryRow'
    puts query_row(board, row_column)
  elsif command == 'QueryCol'
    puts query_column(board, row_column)
  end
end

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split
  command = line[0]
  row_column = line[1].to_i
  position_value = line[2].to_i
  puts execute_command(command, board, row_column, position_value)
end



# testing
# line = line.chomp.split
# command = line[0]
# row_column = line[1].to_i
# position_value = line[2].to_i
# puts execute_command(command, board, row_column, position_value)

# line = "SetCol 32 20"
# line = "SetRow 15 7"
# line = "SetRow 16 31"
# line = "QueryCol 32"

# 5118
