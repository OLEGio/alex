class WorkedTime < ApplicationRecord
  belongs_to :user

  validate :end_after_start
  validates :start_date, :end_date, presence: true

  private
  def end_after_start
    return if start_date.blank? || end_date.blank?

    if start_date > end_date
      errors.add(:start_date, "Wrong date enter.#{start_date}.#{end_date}")
    end
  end

end
