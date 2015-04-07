class Story < ActiveRecord::Base
  validates :title, :link, :category, :upvotes, presence: true

  def self.popular
    where 'upvotes >= ?', 4
  end

  def self.recent
    where 'created_at >= ?', Date.today
  end

  def self.search_for(query)
    where('title LIKE :query OR category LIKE :query', query: "%#{query}%")
  end
end
