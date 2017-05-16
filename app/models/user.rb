class User < ApplicationRecord
		include ActiveModel::Validations
  authenticates_with_sorcery!

  has_many :sales
  has_many :comunas
  
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :email, uniqueness: true, email_format: { message: 'Es invavalilido el formato' }

validate :fecha_de_vencimiento_no_puede_estar_en_el_pasado

validates :nombre,  length: {minimum: 2, maximum: 50, :message => " debe tener entre 2 y 50 caracteres"}
validates :calle,  length: {minimum: 2, maximum: 50, :message => " debe tener entre 2 y 50 caracteres"}
validates :rut, rut: true
validates :telefono, numericality: { only_integer: true, :message => " debe contener solo numeros"}
validates :telefono1, numericality: { only_integer: true, :message => " debe contener solo numeros"}
validates :sueldo,  length: {minimum: 2, maximum: 50, :message => " debe tener entre 2 y 50 caracteres"}


VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, format: { :with => VALID_EMAIL_REGEX , message: "el formato del correo es invalido" }

def fecha_de_vencimiento_no_puede_estar_en_el_pasado
	if fechaingreso.blank? and fechaingreso < Date.today
		errors.add(:fechaingreso, "ingresaste una fecha que paso")
end
end
end
