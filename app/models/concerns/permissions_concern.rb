module PermissionsConcern
	extend ActiveSupport::Concern
	
		def is_editor?
			self.permission_level >= 2
		end

		def is_admin?
			self.permission_level >= 3
		end
end