class Post < ActiveRecord::Base
  validates :title, :body, :author, presence: true
  validates :title, uniqueness: true
end
