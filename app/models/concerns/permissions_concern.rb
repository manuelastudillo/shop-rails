module PermissionsConcern
	extend ActiveSupport::Concern

def is_admin?
	self.admin = admin
end

end
