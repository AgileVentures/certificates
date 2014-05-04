require 'spec_helper.rb'


describe Certificate do
  before (:each) do
    @certificate = FactoryGirl.build(:certificate)
  end

  it 'should respond to set_identifier' do
    Certificate.new(attributes_for(:certificate)).should respond_to :set_identifier
  end

  describe "validations" do
    context 'valid attributes' do
      it "should be valid with a name" do
        create(:certificate, :student_name => "Thomas").should be_valid
      end
      it "should be valid with a course title" do
        create(:certificate, :course_name => "Course Title").should be_valid
      end

      it "should be valid with a date" do
        create(:certificate, :generated_at => "2014-01-01").should be_valid
      end

    end

    context 'invalid attributes' do
      before do
        @certificate = FactoryGirl.create(:certificate)
      end

      it 'should NOT be valid without a name' do
        build(:certificate, :student_name => '').should_not be_valid
        @certificate.student_name = ''
        expect(@certificate.save).to be_false
      end

      it 'should NOT be valid without a course title' do
        build(:certificate, :course_name => '').should_not be_valid
        @certificate.course_name = ''
        expect(@certificate.save).to be_false

      end

      it 'should NOT be valid without a date' do
        build(:certificate, :generated_at => '').should_not be_valid
        @certificate.generated_at = ''
        expect(@certificate.save).to be_false

      end

      it 'should NOT be valid with a badly formatted date' do
        build(:certificate, :generated_at => "41/31/14").should_not be_valid
      end
    end
  end
end




