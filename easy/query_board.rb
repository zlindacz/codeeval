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
