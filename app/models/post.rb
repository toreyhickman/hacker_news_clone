class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :url, :presence => true
  validates :website, :presence => true
  validates :user_id, :presence => true

  belongs_to :user
  has_many :comments
  
  def url_link=(url_link)
    set_url(url_link)
    set_website(url_link)
  end

  def set_url(url_link)
    self.url = url_link
  end

  def set_website(url_link)
    self.website = url_link.slice(/[a-zA-Z\-]*\.*[a-zA-Z\-]+\.[a-zA-Z]{2,}/)
  end
end
