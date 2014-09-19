xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "Antonio's Ramblings"
  xml.id "http://blog.santosvelasco.com/"
  xml.link "href" => "http://blog.santosvelasco.com/"
  xml.link "href" => "http://blog.santosvelasco.com/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "Antonio Santos" }

  blog.articles[0..10].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article.url
      xml.id article.url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "Antonio Santos" }
      xml.content article.body, "type" => "html"
    end
  end
end
