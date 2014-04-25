require File.expand_path '../../app.rb', __FILE__
require 'spec_helper.rb' 

describe 'GET /' do	
	it "should load the home page" do
    #get '/'
    debugger 
    visit '/'
    page.should have_css('h1.title', text: "Agile Ventures")
	  page.should have_content("Certificate validation")
	end
end

describe 'GET /verify/:hash' do
  before (:each) do
    #TODO: Stub out certificates
  end
  
 it 'should render valid.erb in hash is valid' do
   pending
 end
 
 it 'should render invalid.erb in hash is invalid' do
   pending
 end
   
end
