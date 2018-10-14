class User < ApplicationRecord
  # encrypt password
  has_secure_password

  has_many :todos, dependent: :destroy, foreign_key: :created_by

  validates_presence_of :name, :password_digest
  validates :email, presence: true, uniqueness: true
  validate :password_complexity
  
  private
  
  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
    errors.add :password, "Complexity requirement not met. Length   
    should be 8-70 characters and include: 1 uppercase, 1 lowercase, 
    1 digit and 1 special character"
  end
end
