class Contact < ApplicationRecord
  belongs_to :entity, polymorphic: true
  # validates :name,:unp, presence: true
  # validates :name, uniqueness: { case_sensitive: false }
end
