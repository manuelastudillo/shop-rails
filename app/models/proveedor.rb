class Proveedor < ApplicationRecord
  belongs_to :comuna

  validates :email, uniqueness: true, email_format: { message: 'Es invavalilido el formato' }

validates :name,  length: {minimum: 2, maximum: 50, :message => " debe tener entre 2 y 50 caracteres"}
validates :rut, rut: true
validates :fono, numericality: { only_integer: true, :message => " debe contener solo numeros"}

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, format: { :with => VALID_EMAIL_REGEX , message: "el formato del correo es invalido" }


end
