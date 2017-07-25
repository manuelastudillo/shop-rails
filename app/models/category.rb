# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
	include ActiveModel::Validations

 has_many :item, dependent: :destroy
 validates_uniqueness_of :name, :message => 'Ya está registrado'

	validates :name, presence: true
	validates :name, length: {minimum: 2, maximum: 50, :message => " debe tener entre 2 y 50 caracteres"}


end
