class User < ApplicationRecord
		include ActiveModel::Validations
  authenticates_with_sorcery!
  include PermissionsConcern

  has_many :sales
  has_many :comunas
  
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :email, uniqueness: true, email_format: { message: 'Es invavalilido el formato' }

  validates :nombre, length: {minimum: 2, maximum: 50, :message => "El nombre debe tener entre 2 y 50 caracteres"}
  validates :nombre, :presence => {:message => "Usted debe ingresar un nombre"}
  validates :apellido, length: {minimum: 2, maximum: 50, :message => "El Apellido debe tener entre 2 y 50 caracteres"}
  validates :apellido, :presence => {:message => "Usted debe ingresar un Apellido"}

  validates :rut, rut: true

  validates :sueldo,  length: {minimum: 2, maximum: 50, :message => " debe tener entre 2 y 50 caracteres"}

  validates :telefono, numericality: { :greater_than_or_equal_to => 0, message: "no se permiten telefono que partan con 0"}
  validates :telefono, numericality: {only_integer: true, message: "solo se permiten números enteros"}
  validates :telefono, length: {is: 9, message: "el valor debe tener 9 caracteres"}

  validates :sueldo, numericality: { :greater_than_or_equal_to => 0, message: "no se permiten sueldo que partan con 0"}
  validates :sueldo, numericality: {only_integer: true, message: "solo se permiten números enteros"}
  validates :sueldo,  length: {minimum: 6, maximum: 7, :message => " debe tener entre 6 y 7 numeros"}


VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, format: { :with => VALID_EMAIL_REGEX , message: "el formato del correo es invalido" }




end
