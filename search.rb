require 'nokogiri'
require 'open-uri'
require 'uri'

urls = []
search_word = URI.encode("作業用BGM")

url = "https://www.youtube.com/results?search_query=#{search_word}"

doc = Nokogiri::HTML(open(url))
elements = doc.xpath("//h3[@class='yt-lockup-title']/a")
elements.each do |a|
  code = a.attributes['href'].value
  urls << ("https://www.youtube.com" + code) if code.include?('watch')
end


urls.each { |url|
  puts url
  doc = Nokogiri::HTML(open(url), nil, "UTF-8")
  description = doc.xpath("//p[@id='eow-description']").text
  puts description
}
