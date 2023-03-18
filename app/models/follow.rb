class Follow < ApplicationRecord
  belongs_to :user # User opting to follow another user
  belongs_to :followed_user, class_name: 'User' # User being followed
end
