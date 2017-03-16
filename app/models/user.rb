class User < ApplicationRecord
		include ActiveModel::Validations
  authenticates_with_sorcery!

  has_many :sales
  has_many :comunas
  
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :email, uniqueness: true, email_format: { message: 'Es invalido el formato' }
end
