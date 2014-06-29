require 'spec_helper.rb' 
require 'debugger'

describe Certificate do
  before (:each) do
    @certificate = {student_name: 'Thomas',
                    generated_at: Date.today,
                    course_name: 'My course',
                    course_desc: 'My course description'}
  end

  describe "validations" do
    it 'should be valid with the proper values' do
      Certificate.new(@certificate).should be_valid
    end

    it "should require a name" do
      Certificate.new().should_not be_valid
      Certificate.new(@certificate.merge :student_name => '').should_not be_valid
    end

    it 'should require generated_at' do
      Certificate.new(@certificate.merge :generated_at => nil).should_not be_valid
    end

    it 'should require course_name' do
      Certificate.new(@certificate.merge :course_name => nil).should_not be_valid
    end

    it 'identifier should be unique' do
      Certificate.create!(@certificate)
      Certificate.new(@certificate).should_not be_valid
    end
  end
end

