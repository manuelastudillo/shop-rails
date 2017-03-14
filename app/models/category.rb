class Category < ApplicationRecord
	include ActiveModel::Validations
	
	validates :nombre, presence: true


end