class User < ActiveRecord::Base
  include BCrypt
  has_many :messages
  has_one :location, as: :locationable

  has_many :characters, foreign_key: :player_id

  # validates :proximity, numericality: {only_integers: true}

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validate :password_validation, on: :create

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
    elsif self.input_password.length < 6
      @errors.add(:password, "must be longer than 6 characters")
    end
  end

end
