xml.instruct! :xml, :version => "1.0"
xml.rss(
  "version" => "2.0",
  "xmlns:content" => "http://purl.org/rss/1.0/modules/content/",
  "xmlns:wfw" => "http://wellformedweb.org/CommentAPI/",
  "xmlns:dc" => "http://purl.org/dc/elements/1.1/",
  "xmlns:atom" => "http://www.w3.org/2005/Atom",
  "xmlns:sy" => "http://purl.org/rss/1.0/modules/syndication/",
  "xmlns:slash" => "http://purl.org/rss/1.0/modules/slash/"
) do
  xml.channel do
    xml.title "KAKETAN.COM"
    xml.description "いま最も注目すべき KAKETAN の発信する情報メディア"
    xml.link root_url
    xml.language "ja-ja"
    xml.ttl "40"
    xml.pubDate(Time.current.strftime("%a, %d %b %Y %H:%M:%S %Z"))
    xml.atom :link, "href" => diaries_url(format: :rss), "rel" => "self", "type" => "application/rss+xml"
    @diaries.each do |diary|
      xml.item do
        xml.title diary.title
        xml.description do
          xml.cdata! strip_tags(diary.content)[0..110]
        end
        xml.pubDate diary.created_at
        xml.guid diary_url(diary)
        xml.link diary_url(diary)
      end
    end
  end
end
