# typed: true

extend T::Sig

all_num = T.let([], T::Array[Integer])
sum = 0

File.open(ARGV[0]).each_line do |line|
  break if line.empty?

  arr = T.let([], T::Array[Integer])

  a = T.let(false, T::Boolean)
  b = T.let(false, T::Boolean)

  line.each_char do |char|
    unless char.to_i.zero? || a
      arr << char.to_i

      a = true
    end
  end

  line.each_char.reverse_each do |char|
    unless char.to_i.zero? || b
      arr << char.to_i

      b = true
    end
  end

  all_num << arr.join.to_i
end

all_num.each do |num|
  sum += num
end

puts sum
