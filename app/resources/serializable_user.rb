class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'
  id { @object.uuid }

  attributes :username, :first_name, :last_name, :following_count, :followers_count

  has_many :records
end
