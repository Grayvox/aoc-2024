# frozen_string_literal: true

def solve_one
  split_inputs
end

def split_inputs
  a = []
  b = []
  contents = []
  File.open('lib/solutions/one/inputs.txt', 'r') do |file|
    contents = file.read.split
  end
  contents.each_with_index do |el, i|
    next i.odd? ? b.push(el.to_i) : a.push(el.to_i)
  end
  calculate_diff(a, b)
end

def calculate_diff(first, second)
  first = first.sort
  second = second.sort
  result = 0
  first.each_with_index do |_, i|
    result += (first[i] - second[i]).abs
  end
  result
end

puts solve_one
