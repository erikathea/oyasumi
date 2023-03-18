class User < ApplicationRecord
  before_create :generate_uuid
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true

  has_many :followed_users, class_name: 'Follow', foreign_key: 'followed_user_id'
  has_many :records

  def generate_uuid
    self.uuid = SecureRandom.uuid if self.uuid.blank?
  end
end
