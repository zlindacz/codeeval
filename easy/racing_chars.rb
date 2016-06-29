require 'byebug'


File.open(ARGV[0]) do |f|
  # byebug
  lines = f.count
  f.each_with_index do |line, idx|
    byebug
    if idx == 0 || idx == lines-1
      puts 'hi'
    end
  end
  puts lines
end

# File.open(ARGV[0]).each_with_index do |line, idx|
#   byebug
#   if idx == 0 || idx == File.lines.size-1
#     puts 'hi'
#   end
# end