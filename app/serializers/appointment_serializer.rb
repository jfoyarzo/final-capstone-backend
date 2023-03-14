class AppointmentSerializer
  include JSONAPI::Serializer
  attributes :id, :user_id, :investigator_id, :date, :city
end
