File.open(ARGV[0]).each_line do |line|
  line = line.split(',')

  def multiples_of(num1, m)
    m = m.to_i
    i = 1
    while true
      return i*m if i*m >= num1.to_i
      i += 1
    end
  end

  puts multiples_of(line[0], line[1])
end



def multiples_of(num1, m)
  m = m.to_i
  i = 1
  while true
    return i*m if i*m >= num1.to_i
    i += 1
  end
end

File.open(ARGV[0]).each_line do |line|
  line = line.split(',')

  puts multiples_of(line[0], line[1])
end
