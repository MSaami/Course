class LearningPathSerializer
  include JSONAPI::Serializer
  attributes :name
  attributes :courses do |object|
    CourseSerializer.new(object.courses).serializable_hash
  end
end
