class Record < ApplicationRecord
  validates :clock_in, presence: true
  validates :clock_out, presence: true

  belongs_to :user
end
