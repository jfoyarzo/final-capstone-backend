class InvestigatorSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :photo, :description, :fee, :rating
end
