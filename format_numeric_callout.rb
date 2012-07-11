

def humanize_number(number, power, magnitude_symbol)
  # three digit string representation of number
  number = (number / (10.0**power))
  integer_part = number.to_i.to_s
  case integer_part.length
  when 1
    number = (number * 100).round.to_f / 100
  when 2
    number = (number * 10).round.to_f / 10
  when 3
    number = number.round
  end
  numeric_string = number.to_s
  numeric_string = numeric_string.gsub(/.0\z/,'')
  return numeric_string + magnitude_symbol
end

def format_numeric_callout(value)
  # three digit string representation of number,
  # e.g. given 2112, return 2.11K
  value_log10 = Math.log10(value).floor rescue 0
  case
  when (value_log10 < 3)
    callout = value.to_s
  when (value_log10 >= 3) && (value_log10 < 6)
    callout = humanize_number(value, 3, "K")
  when (value_log10 >= 6) && (value_log10 < 9)
    callout = humanize_number(value, 6, "M")
  when (value_log10 >= 9) && (value_log10 < 12)
    callout = humanize_number(value, 9, "B")
  else
    callout = "eep!"
  end
  return callout
end


numbers = [888,1001,1009,2112,20999,2099999,666666666,66667868898,6666786889886]

puts "Representative numeric callouts..."
numbers.each do |num|
  row = ''
  row << num.to_s
  row << ' ' * (16 - num.to_s.length)
  row << '=>  '
  row << format_numeric_callout(num)
  puts row
end

