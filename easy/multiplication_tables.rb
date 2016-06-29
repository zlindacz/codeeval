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