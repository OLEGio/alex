class User < ApplicationRecord
  has_many :worked_times
  belongs_to :grade
  has_one :personal_number
  has_many :contacts, as: :entity

  validates :name,:amount, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  before_validation :normalize_name, on: :create

  private
  def normalize_name
    self.name = name.downcase.titleize
  end

end
