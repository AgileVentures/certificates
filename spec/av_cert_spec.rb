require_relative '../av_certs.rb' 
require 'spec_helper.rb' 

describe 'write_to_cert' do	
	it "should assign a name to name" do
	  pending
	end
  
	it "should assign a date to date" do
	  pending
	end
end

describe "Testing Prawn" do
    context "Rendered PDF-Certificate" do
      before(:each) do
        @date = Date.today
        write_to_cert(name: 'Thomas', date: @date.to_s, course_name: 'Test Course', course_desc: 'Test Description' )
        @rendered_pdf = File.open "pdf/Thomas-#{@date}.pdf"
        @text_analysis = PDF::Inspector::Text.analyze(@rendered_pdf)
        #puts "created #{File.basename(@rendered_pdf)}"
      end
           
      it "should have 'Thomas' as content" do        
       expect(@text_analysis.strings).to be_include("Thomas")                          
      end
      
      it "should have issue date as content" do
        expect(@text_analysis.strings).to be_include("#{@date.strftime('Issued on %A, %B %e, %Y')}") 
      end
      
      after(:each) do
        FileUtils.rm_rf "#{File.basename(@rendered_pdf)}"
        #puts "deleted #{File.basename(@rendered_pdf)}"
      end
        
    end
end 
