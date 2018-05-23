class Company < ApplicationRecord
  has_one :contact
  validates :name,:unp, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
