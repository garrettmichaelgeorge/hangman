DICTIONARY = IO.readlines("5desk.txt").map(&:strip).select { |word| word.length.between?(5, 12)}

word = DICTIONARY.sample

p dictionary
puts word
