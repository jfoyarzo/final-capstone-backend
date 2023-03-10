class InvestigatorSerializer
  include JSONAPI::Serializer
  attributes :name, :photo, :description, :fee, :rating
end
