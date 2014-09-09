require 'json'
require 'awesome_print'


file = JSON.parse(IO.read("../data/quotes.json"))

hash = {}
file.each do |key, value|
  value.each do |item|
    array_of_words = item.split
    array_of_words.each do |word|
      if hash[word.downcase] == nil
        hash[word.downcase] = {count: 1, people: [key]}
      else
        hash[word.downcase][:count] += 1
        hash[word.downcase][:people] << key

      end
    end
  end
end



ap hash