class Player < ApplicationRecord
  validates :name, presence: true
  validate :is_valid_phone_number

  private

  PHONE_NUMBER_REGEX = /^\(?[\d]{3}\)?[\s|-]?[\d]{3}-?[\d]{4}$/

  def is_valid_phone_number
    unless phone_number =~ (PHONE_NUMBER_REGEX)
      errors.add(:phone_number, message: "is invalid")
    end
  end
end
