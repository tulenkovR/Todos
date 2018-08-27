class User < ApplicationRecord
  # encrypt password
  has_secure_password

  has_many :todos, dependent: :destroy, foreign_key: :created_by

  validates_presence_of :name, :password_digest
  validates :email, presence: true, uniqueness: true
end
