require 'nokogiri'
require 'open-uri'

class Browser
  def fetch_content(url)
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    title = html_doc.search('h1').each do |element|
      element.text.strip
    end
    "/#{title}/"
  end
end
