class FestAttendee < ActiveRecord::Base
  belongs_to :fest
  belongs_to :attendee, class_name: User
  validates :fest_id, :attendee_id, presence: true
end
