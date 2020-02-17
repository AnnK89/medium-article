require 'nokogiri'

file = 'fraise.html' # or 'strawberry.html'
doc = Nokogiri::HTML(File.open(file), nil, 'utf-8')

doc.css('.recipe-card__duration__value').each do |el|
  puts el.text
end
