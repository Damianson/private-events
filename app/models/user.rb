class User < ApplicationRecord
  has_many :attendances, foreign_key: "attendee_id"
  has_many :attended_events, through: :attendances
  has_many :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
end
