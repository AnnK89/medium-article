class Post < ActiveRecord::Base
  belongs_to :user

  # TODO: Add some validation
  validates :user, presence: true
  validates :name, presence: true
  validates :name, length: { minimum: 5 }
  validates :url, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :url, format: { with: /http:\/\/.*\z/ }
end
