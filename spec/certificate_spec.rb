
require 'spec_helper.rb' 


  describe Certificate do
    before (:each) do
      @certificate = {student_name: 'Thomas',
                              generated_at: Date.today,
                              course_name: 'My course',
                              course_desc: 'My course description'}
  
    end
    
    describe "validations" do
      it "should require a name" do
        Certificate.new().should_not be_valid
        Certificate.new(@certificate, :student_name => '').should_not be_valid
        debugger
        Certificate.new(@certificate, :student_name => "Thomas").should be_valid
      end
    end
  end




