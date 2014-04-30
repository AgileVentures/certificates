
require 'spec_helper.rb' 


  describe Certificate do
    before (:each) do
      #@certificate = create(:certificate)
    end
    
    describe "validations" do
      it 'should NOT be valid without a name' do
        build(:certificate, :student_name => '').should_not be_valid
      end
      
      it "should be valid with a name" do
        create(:certificate, :student_name => "Thomas").should be_valid
      end
    end
  end




