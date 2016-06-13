class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :weight

  belongs_to :function
  link(:self) { "https://example.com/link_author/#{object.id}" }
  # link :author { link_author_url(object) }
  # link :link_authors { link_authors_url }
  # link :other, 'https://example.com/resource'
  # link :posts { link_author_posts_url(object) }
end
