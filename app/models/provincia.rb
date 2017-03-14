class Provincia < ApplicationRecord
		  self.table_name = "provincias"
		   has_many :comuna
		    belongs_to :region
end
