require 'date'

class DateValidator < ActiveModel::Validator
  def validate(record)
    Date.parse(record.generated_at.to_s)
  rescue ArgumentError
    record.errors.add(:generated_at, "invalid date format")
  end
end
