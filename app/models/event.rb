class Event < ApplicationRecord
    has_many :attendances, foreign_key: "event_id"
    has_many :attendees, through: :attendances
    belongs_to :creator, class_name: "User", foreign_key: "user_id"
end
