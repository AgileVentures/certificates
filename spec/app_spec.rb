require_relative '../app.rb'
require 'spec_helper'

describe 'GET /' do
  context 'Visit application' do
    it "should load the home page" do
      visit '/'
      page.should have_selector('h1', text: "AgileVentures")
      page.should have_selector('h2', text: "Certificate validation")
    end
  end
end

describe 'GET /verify/:hash' do
  context 'Validate certificate' do
    before (:each) do
      @certificate = FactoryGirl.build(:certificate)
      @hash = Digest::SHA256.hexdigest("#{@certificate.student_name} - #{@certificate.course_name} - #{@certificate.generated_at}")
      FactoryGirl.create(:certificate, :identifier => @hash)
      #d913f23de5fec32d7d6a836f20f07940a7ae9c883e6512fd33c4475bb0276634
    end

    it 'should render valid.erb in hash is valid' do
      visit '/verify/d913f23de5fec32d7d6a836f20f07940a7ae9c883e6512fd33c4475bb0276634'
      expect(page).to have_content 'valid'
    end

    it 'should render invalid.erb in hash is invalid' do
      visit '/verify/12fd33c4475bb0276634'
      expect(page).to have_content 'invalid'
    end
  end
end

