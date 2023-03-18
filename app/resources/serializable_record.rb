class SerializableRecord < JSONAPI::Serializable::Resource
  type 'records'

  attributes :clock_in, :clock_out, :remarks, :sleep_duration

  has_many :records
end
