# == Schema Information
#
# Table name: units
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Unit < ApplicationRecord
	include ActiveModel::Validations

 has_many :item, dependent: :destroy

	validates :name, presence: true
    validates :name,  length: {minimum: 2, maximum: 50, :message => " debe tener entre 2 y 50 caracteres"}

end