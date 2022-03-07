class Task < ApplicationRecord
  validates :title, presence: true
  validates :details, presence: true

  def truncated_details
    "#{details[0..10]}..."
  end
end
