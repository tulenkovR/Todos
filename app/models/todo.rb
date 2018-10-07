class Todo < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user, foreign_key: :created_by

  validates_presence_of :title, :created_by
end
