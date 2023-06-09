# frozen_string_literal: true

class CourseSerializer
  include JSONAPI::Serializer
  attributes :name
  attributes :author do |object|
    UserSerializer.new(object.author)
  end
end
