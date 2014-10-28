class User < ActiveRecord::Base
  has_many :posts

before_create :create_remember_token
before_save :normalize_fields

# Validates name:
  validates :name,
    presence: true,
    length: {maximum: 50}

  # Validates email:
  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    format: {with:  /[^@]+@[^@]+/ }


  # Validates password length
  validates :password,
    length: {minimum: 8}

  # secure password feature
  has_secure_password

  # Create a new remember token for the user:
  def self.new_remember_token
      SecureRandom.urlsafe_base64
  end

  # Hash a token:
  def self.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  # Create a new sessions token for the user
  def create_remember_token
    remember_token = User.hash(User.new_remember_token)
  end

  # Normalize fields for consistency
  def normalize_fields
    # self.email.downcase!
  end
end

