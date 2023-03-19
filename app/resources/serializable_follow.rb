class SerializableFollow < JSONAPI::Serializable::Resource
  type 'users'
  id { @object.followed_user.uuid }

  attribute :username do @object.followed_user.username end
  attribute :first_name do @object.followed_user.first_name end
  attribute :last_name do @object.followed_user.last_name end
  has_many :past_week_records
end
