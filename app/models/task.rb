class Task < ApplicationRecord
  enum :status, {
    pending: 0,
    in_progress: 1,
    completed: 2
  }

  validates :title, presence: true
  validates :status, presence: true

  before_save :set_completed_at

  scope :with_status, ->(status) {
    where(status: status) if status.present?
  }

  scope :due_from, ->(date) {
    where(due_date: date..) if date.present?
  }

  scope :due_to, ->(date) {
    where(due_date: ..date) if date.present?
  }

  private

  def set_completed_at
    return unless will_save_change_to_status?

    self.completed_at =
      if completed?
        completed_at || Time.zone.now
      else
        nil
      end
  end
end
