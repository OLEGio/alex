class AccessLevel < ApplicationRecord

  belongs_to :user

  validates :level, presence: true
  validates :description, length: { in: 6..20 }
  before_validation :normalize_description,  on: :create

  def normalize_description
    self.description = description.downcase
  end
end
