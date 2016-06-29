# only works for numbers up to 3999

def romanize(number_array)
  roman = ['I', 'X', 'C', 'M']
  roman_half = ['V', 'L', 'D']
  result = ''

  number_array.reverse.each_with_index do |number, idx|
    if number == 9
      result += roman[idx+1] + roman[idx]
    elsif number > 5
      result += roman[idx] * (number % 5) + roman_half[idx]
    elsif number == 5
      result += roman_half[idx]
    elsif number == 4
      result += roman_half[idx] + roman[idx]
    else
      result += roman[idx] * number
    end
  end
  result.reverse
end

File.open(ARGV[0]).each_line do |line|
  line = line.chomp.chars.map(&:to_i)
  puts romanize(line)
end


# testing
# line = line.chomp.chars.map(&:to_i)
# puts romanize(3992) # => MMMCMXCII
# puts romanize(159) # => CLIX
# puts romanize(296) # => CCXCVI


# before refactoring; only for numbers up to 3999
# def romanize(number)
#   arabic_to_roman = { 1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V',
#                     6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX', 10 => 'X',
#                     50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M' }
#   num = number
#   result = ''
#   while num > 0
#     if num > 1000
#       result += arabic_to_roman[1000] * (num / 1000)
#       num %= 1000
#     elsif num >= 900
#       result = result + arabic_to_roman[100] + arabic_to_roman[1000]
#       num %= 900
#     elsif num >= 500
#       result += arabic_to_roman[500]
#       num %= 500
#     elsif num >= 400
#       result = result + arabic_to_roman[100] + arabic_to_roman[500]
#       num %= 400
#     elsif num >= 100
#       result = result + arabic_to_roman[100] * (num / 100)
#       num %= 100
#     elsif num >= 90
#       result = result + arabic_to_roman[10] + arabic_to_roman[100]
#       num %= 90
#     elsif num >= 50
#       result += arabic_to_roman[50]
#       num %= 50
#     elsif num >= 40
#       result = result + arabic_to_roman[10] + arabic_to_roman[50]
#       num %= 40
#     elsif num > 10
#       result = result + arabic_to_roman[10] * (num / 10)
#       num %= 10
#     else
#       result += arabic_to_roman[num]
#       break
#     end
#   end
#   result
# end

# File.open(ARGV[0]).each_line do |line|
#   line = line.chomp.chars.map(&:to_i)
#   puts romanize(number)
# end