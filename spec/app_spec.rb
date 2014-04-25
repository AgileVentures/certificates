require_relative '../app.rb' 
require 'spec_helper'

describe 'GET /' do	
	it "should load the home page" do
    visit '/'
    page.should have_selector('h1', text: "AgileVentures")
	  page.should have_selector('h2', text: "Certificate validation")
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
