require './date_validator.rb'

class Certificate < ActiveRecord::Base
  before_create :set_identifier
  
  validates_with DateValidator
  
  validates :course_name, allow_blank: false, presence: true
  validates :generated_at, allow_blank: false, presence: true
  validates :student_name, presence: true, allow_blank: false

  #private

  def set_identifier
    self.identifier = Digest::SHA256.hexdigest("#{student_name} - #{course_name} - #{generated_at}")
  end
end
