class Grade < ApplicationRecord
  has_many :users
  validates :grade,:rate, presence: true
  validates :grade, uniqueness: { case_sensitive: false }
end
