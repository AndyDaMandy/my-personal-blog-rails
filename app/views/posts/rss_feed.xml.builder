# frozen_string_literal: true

xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0' do
  xml.channel do
    xml.title 'Andy\'s Tech and Art Space'
    xml.description 'I write about tech, art, and various other tropics'
    xml.link root_url

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.description
        xml.body ActionController::Base.helpers.strip_tags(render(html: post.content.to_s).squish) # Render ActionText content as HTML and strip tags
        xml.pubDate post.created_at.strftime('%a, %d %b %Y %H:%M:%S %z')
        xml.link post_url(post)
      end
    end
  end
end
