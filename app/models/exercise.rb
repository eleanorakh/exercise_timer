class Exercise < ActiveRecord::Base
  belongs_to :workout
  validates :name, :duration, presence: true
end
