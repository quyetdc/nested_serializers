class Book < ApplicationRecord
  has_many :details
  has_many :authors, through: :details

  has_many :pages
  accepts_nested_attributes_for :pages
end
