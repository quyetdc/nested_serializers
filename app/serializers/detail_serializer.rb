class DetailSerializer < ActiveModel::Serializer
  attributes :id, :description, :books

  def books
    ActiveModelSerializers::SerializableResource.new(object.book, each_serializer: BookSerializer)
  end
end
