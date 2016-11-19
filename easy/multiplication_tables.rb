=begin
MULTIPLICATION TABLES
CHALLENGE DESCRIPTION:

Print out the grade school multiplication table upto 12*12.

INPUT SAMPLE:

There is no input for this program.

OUTPUT SAMPLE:

Print out the table in a matrix like fashion, each number formatted to a width of 4 (The numbers are right-aligned and strip out leading/trailing spaces on each line). The first 3 line will look like:

1   2   3   4   5   6   7   8   9  10  11  12
2   4   6   8  10  12  14  16  18  20  22  24
3   6   9  12  15  18  21  24  27  30  33  36
=end

def multiplication_table
  line = []
  (1..12).each do |i|
    (1..12).each do |j|
      line << (i*j).to_s.rjust(4)
    end
  end

  line.map!.with_index do |number, idx|
    # first number %12 == 0 should be stripped of spaces
    if idx % 12 == 0
      number.lstrip
    # last number of row %12 == 11 should have new_line
    elsif idx % 12 == 11
      number << "\n"
    # otherwise number
    else
      number
    end
  end
  line.join
end

puts multiplication_table
