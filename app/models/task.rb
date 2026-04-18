class Task < ApplicationRecord
  enum :status, {
    pending: 0,
    in_progress: 1,
    completed: 2
  }

  validates :title, presence: true
  validates :status, presence: true

  scope :with_status, ->(status) {
    where(status: status) if status.present?
  }

  scope :due_from, ->(date) {
    where(due_date: date..) if date.present?
  }

  scope :due_to, ->(date) {
    where(due_date: ..date) if date.present?
  }
end
