class Record < ApplicationRecord
  validates :clock_in, presence: true

  belongs_to :user
end
