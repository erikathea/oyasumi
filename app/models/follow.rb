class Follow < ApplicationRecord
  belongs_to :user # User opting to follow another user
  belongs_to :followed_user, class_name: 'User' # User being followed

  def past_week_records
    followed_user.past_week_records
    # TODO: consolidate sleep hours for a day
    # e.g. user afternoon nap + evening sleep
  end
end
