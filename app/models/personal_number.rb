class PersonalNumber < ApplicationRecord
  has_one :user
  has_one :access_level, through: :user
  validates :number, presence: true
end
