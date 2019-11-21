class User < ApplicationRecord
  # Direct associations

  has_many   :flights,
             :class_name => "FlightTable",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :phone, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
