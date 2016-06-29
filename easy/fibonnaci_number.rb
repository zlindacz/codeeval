def fib(n)
  n = n.to_i
  base = [0,1]
  return base[n] if n < 2
  until base.size > n
    base << (base[-1] + base[-2])
  end
  base.last
end

File.open(ARGV[0]).each_line do |line|
  puts fib(line.chomp)
end