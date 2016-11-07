class Proyect < ActiveRecord::Base
	include AASM

	belongs_to :user
	has_many :responsibilities, dependent: :destroy
	has_many :responsibles, through: :responsibilities
	
	has_many :has_categories , dependent: :destroy
	has_many :categories, through: :has_categories

	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, length:{minimum:20}
	
	after_create :save_categories 
	after_update :save_updateategories 
	after_create :save_responsibles
	after_update :save_updateresponsibles

	has_attached_file :cover, styles:{ medium: "120x720", thumb:"800x600", mini:"400x200"}  #decirle al modelo q tiene attach de imagen
	validates_attachment_content_type :cover , content_type: /\Aimage\/.*\Z/

	
	scope :ultimos, ->{order("created_at DESC")}
	scope :asideultimos, ->{order("created_at DESC").limit(5)}

	scope :search_by_projects, -> (object) { where("#{object[:field]} like ?", "%#{object[:textsearch]}%")}
	scope :search_by_categories, -> (object) { includes(:categories).where("categories.name like ?", "%#{object[:textsearch]}%").references(:categories) }
	scope :search_by_responsibles, -> (object) { includes(:responsibles).where("responsibles.first_name LIKE ? OR responsibles.last_name LIKE ?", "%#{object[:textsearch]}%", "%#{object[:textsearch]}%").references(:responsibles) }

	#Custon Setter  para muchos a muchos
	# metodo asignar valor al atributo , guarda en una variable
	def categories=(value)
		@categories= value
	end
	def responsibles=(value)
		@responsibles= value
	end

	aasm column: "state" do
		state :in_draft, initial: true
		state :finished

		event :finish_it do
			transitions from: :in_draft, to: :finished
		end

		event :begin do
			transitions from: :finished, to: :in_draft
		end
	end
	
	private
		def save_categories # guarda las categioas en has categori
			
			unless @categories.nil? 
				@categories.each do |category_id|
					unless category_id.nil?
						HasCategory.create(category_id: category_id, proyect_id: self.id)
					end
				end
			end
		end
		def save_updateategories # despues de custom setter se guarda las categioas en has categoria

			unless @categories.nil? 
				self.categories.clear
				@categories.each do |category_id|
					unless category_id.nil?
						HasCategory.create(category_id: category_id, proyect_id: self.id)
					end

				end
			end
		end

		def save_responsibles # despues de custom setter se guarda las categioas en responsibility
			unless @responsibles.nil? 
				@responsibles.each do |responsible_id|
					unless responsible_id.nil?
						Responsibility.create(responsible_id: responsible_id, proyect_id: self.id)
					end
				end
			end
		end

		def save_updateresponsibles # despues de custom setter se guarda las categioas en responsibility

			unless @responsibles.nil? 
				self.responsibles.clear
				@responsibles.each do |responsible_id|
					unless responsible_id.nil?
						Responsibility.create(responsible_id: responsible_id, proyect_id: self.id)
					end
				end
			end
		end

end
