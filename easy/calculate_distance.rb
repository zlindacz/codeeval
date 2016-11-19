=begin
CALCULATE DISTANCE
CHALLENGE DESCRIPTION:

You have coordinates of 2 points and need to find the distance between them.

INPUT SAMPLE:

Your program should accept as its first argument a path to a filename. Input example is the following

1
2
(25, 4) (1, -6)
(47, 43) (-25, -11)
All numbers in input are integers between -100 and 100.

OUTPUT SAMPLE:

Print results in the following way.

1
2
26
90
You don't need to round the results you receive. They must be integer numbers.
=end

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split(/[^-\d]/)
  line.delete('')
  x1 = line[0].to_i
  x2 = line[2].to_i
  y1 = line[1].to_i
  y2 = line[3].to_i
  puts "%.0f" % (((x1-x2)**2 + (y1-y2)**2)**(0.5))
end
