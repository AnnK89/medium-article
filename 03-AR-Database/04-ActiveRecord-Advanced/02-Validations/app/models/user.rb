class User < ActiveRecord::Base
  has_many :posts
  validates :username, presence: true
  validates :email, presence: true
  validates :username, uniqueness: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  before_validation :strip_whitespace
  after_create :send_email

  def strip_whitespace
    self.email = email.strip unless email.nil?
  end

  def send_email
    FakeMailer.instance.mail('boris@lewagon.org', 'Welcome to HN!')
  end
end
