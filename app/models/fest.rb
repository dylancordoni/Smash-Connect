class Fest < ActiveRecord::Base
  has_one :location, as: :locationable
  has_many :fest_attendees
  has_many :attendees, through: :fest_attendees, source: :attendees
  belongs_to :host, class_name: User

  validates :event_time, :host_id, presence: true
end
