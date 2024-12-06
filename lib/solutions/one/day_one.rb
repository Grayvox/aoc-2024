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
  puts result
  find_similarities(first, second)
end

def find_similarities(first, second)
  final_result = 0
  first.each do |parent_el|
    temp_result = 0
    second.each do |el|
      temp_result += 1 if parent_el == el
    end
    final_result += parent_el * temp_result unless temp_result.zero?
  end
  puts final_result
end

solve_one
