class AppointmentSerializer
  include JSONAPI::Serializer
  attributes :user_id, :investigator_id, :date, :city
end
