class Trip < ApplicationRecord
  has_many :user_trips
  has_many :users, through: :user_trips
  belongs_to :destination
  has_many :trip_activities
  has_many :activities, through: :trip_activities
end
