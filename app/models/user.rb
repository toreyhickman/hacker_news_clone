class User < ActiveRecord::Base
  validates :username, :presence => true
  validates :username, :uniqueness => true
  validates :password_hash, :presence => true

  has_many :posts
  has_many :comments

  include BCrypt
    def password
      @password ||= Password.new(password_hash)
    end

    def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password
    end
end
