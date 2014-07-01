class Certificate < ActiveRecord::Base
  before_validation :set_identifier
  
  validates :course_name, presence: true
  validates :generated_at, presence: true
  validates :student_name, presence: true, allow_blank: false
  validates :identifier, presence: true, uniqueness: true

  private

  def set_identifier
    self.identifier = Digest::SHA256.hexdigest("#{student_name} - #{course_name} - #{generated_at}")
  end
end
