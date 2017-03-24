class Character < ActiveRecord::Base
  belongs_to :player_id, class_name: User
  validates :name, presence: true
end
