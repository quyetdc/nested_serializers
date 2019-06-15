class Author < ApplicationRecord
  has_many :details
  has_many :books, through: :details
  
  accepts_nested_attributes_for :books
end
