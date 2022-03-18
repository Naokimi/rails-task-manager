class Task < ApplicationRecord
  validates :title, presence: true

  def truncated_details
    "#{details[0..15]}..."
  end
end
