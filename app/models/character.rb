class Character < ActiveRecord::Base
  belongs_to :player, class_name: User
  validates :name, presence: true
end
