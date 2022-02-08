class Hero < ApplicationRecord
  validates :name, :token, presence: true

  scope :search, ->(term) { where('LOWER(name) LIKE ?', "%#{term.downcase}%") }
  scope :sorted_by_name, -> { order(:name) }
  # scope :sorted_by_name, -> { order(name: :desc) }
end
