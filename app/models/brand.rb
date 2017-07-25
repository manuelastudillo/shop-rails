class Brand < ApplicationRecord
  has_many :item, dependent: :destroy

 validates_uniqueness_of :name, :message => 'Ya está registrado'

	validates :name, length: {minimum: 2, maximum: 50, :message => " debe tener entre 2 y 50 caracteres"}

end
