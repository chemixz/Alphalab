class Responsible < ActiveRecord::Base
	has_many :responsibilities
	has_many :proyects, through: :responsibilities

	validates :first_name, presence: true,length:{minimum:4}, uniqueness: true 
	validates :last_name, presence: true, length:{minimum:4}
	validates :address, presence: true, length:{minimum:8}
	validates :email , presence: true, length:{minimum:4}, uniqueness: true 
	validates :photo, presence: true

	has_attached_file :photo, styles:{ medium: "800x600", thumb:"640x480", mini:"320x240"}  #decirle al modelo q tiene attach de imagen
	validates_attachment_content_type :photo , content_type: /\Aimage\/.*\Z/

	after_create :save_responsibilities
	after_update :save_updateresponsibilities

	def assignproyect=(value)
			@assignproyect= value
	end

	private

	def save_responsibilities # guarda las categioas en has categori
		
		unless @assignproyect.nil? #para los markup 
			@assignproyect.each do |assignproyect_id|
				Responsibility.create(proyect_id: assignproyect_id, responsible_id: self.id)
			end
		end
	end
	def save_updateresponsibilities # guarda las categioas en has categori
		#raise @assignproyect.to_yaml

		unless @assignproyect.nil? #para los markup 
			#raise self.proyects.first.to_yaml
			self.proyects.clear

			@assignproyect.each do |assignproyect_id|
				Responsibility.create(proyect_id: assignproyect_id, responsible_id: self.id)
			end
		end
	end

end
