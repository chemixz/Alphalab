class HasCategory < ActiveRecord::Base
  belongs_to :proyect
  belongs_to :category
  validates_presence_of :proyect
  validates_presence_of :category

  accepts_nested_attributes_for :proyect
  accepts_nested_attributes_for :category
end
