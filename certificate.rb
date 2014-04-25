class Certificate < ActiveRecord::Base
  before_create :set_identifier
  
  validates :course_name, presence: true
  validates :generated_at, presence: true
  validates :student_name, presence: true, uniqueness: true

  private

  def set_identifier
    self.identifier = Digest::SHA256.hexdigest("#{student_name} - #{course_name} - #{generated_at}")
  end
end
