class Brand < ApplicationRecord
  has_many :producto

validates :name, length: {minimum: 2, maximum: 50, :message => " debe tener entre 2 y 50 caracteres"}
validates :abreviacion, length: {minimum: 2, maximum: 50, :message => " debe tener entre 2 y 50 caracteres"}

end
