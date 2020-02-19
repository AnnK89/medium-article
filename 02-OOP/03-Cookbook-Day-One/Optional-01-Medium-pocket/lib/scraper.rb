require 'open-uri'
require 'nokogiri'

def scraper(path, item)
  url = "https://dev.to/#{path}"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search(item).text.strip
end


# Scraper('molly_struve/level-up-your-ruby-skillz-working-with-hashes-4bid')

def scraper_content(path, content)
  url = "https://dev.to/#{path}"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search(content).map(&:text).join("\n\n")
end
