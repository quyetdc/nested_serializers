class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :details

  def details
    ActiveModelSerializers::SerializableResource.new(object.details, each_serializer: DetailSerializer)
  end

  # def author_info_with_details
  #   object.details.map do |k|
  #     k.attributes.merge(ActiveModelSerializers::SerializableResource.new(object.books, each_serializer: BookSerializer))
  #   end
  # end
end
