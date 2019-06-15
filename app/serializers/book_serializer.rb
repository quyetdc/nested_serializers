class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :pages

  def pages
    ActiveModelSerializers::SerializableResource.new(object.pages, each_serializer: PageSerializer)
  end
end
