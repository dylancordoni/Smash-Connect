class Location < ActiveRecord::Base
  belongs_to :locationable, polymorphic: true
  validates :locationable_id, :locationable_type, :city, :state, presence: true

  def locale
    self.address + ", " + self.city + ", " + self.state + " " + self.zipcode
  end
end
