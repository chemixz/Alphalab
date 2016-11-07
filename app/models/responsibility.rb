class Responsibility < ActiveRecord::Base
  belongs_to :proyect
  belongs_to :responsible
  validates_presence_of :proyect
  validates_presence_of :responsible
end
