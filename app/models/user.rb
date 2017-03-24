class User < ActiveRecord::Base
  include BCrypt
  has_many :messages
  has_a :location, as: :locationable
  has_many :mains, foreign_key: :player_id
  has_many :characters, through: :mains

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validate :password_validation

  attr_accessor :input_password

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    self.input_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(input_password)
    self.password == input_password
  end

  def password_validation
    if self.input_password.blank?
      @errors.add(:password, "field missing")
    end
  end

end
