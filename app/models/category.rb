class Category < ActiveRecord::Base
	
	has_many :has_categories
	has_many :proyects, through: :has_categories
	validates :name , presence: true
end
