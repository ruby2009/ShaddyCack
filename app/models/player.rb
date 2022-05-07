class Player < ApplicationRecord
  validates :name, presence: true
  validate :is_valid_phone_number

  has_many :player_events
  has_many :events, through: :player_events
  has_many :player_event_holes
  has_many :holes, through: :player_event_holes

  private

  PHONE_NUMBER_REGEX = /^\(?[\d]{3}\)?[\s|-]?[\d]{3}-?[\d]{4}$/

  def is_valid_phone_number
    unless phone_number =~ (PHONE_NUMBER_REGEX)
      errors.add(:phone_number, message: "is invalid")
    end
  end
end
