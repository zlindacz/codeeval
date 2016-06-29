require 'json'

File.open(ARGV[0]).each_line do |line|
  line = line.chomp
  data = JSON.parse(line)
  data["menu"]["items"].compact!
  ids_with_labels = data["menu"]["items"].select { |item| item.include?("label") }
  to_add = []
  ids_with_labels.each { |item| to_add << item["id"] }
  puts to_add.inject(:+) || 0
end