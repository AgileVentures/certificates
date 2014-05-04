require_relative '../lib/av_certs'
require 'spec_helper.rb'

describe 'Method "write_to_cert"' do
  context 'without any options' do
    before(:each) do
      write_to_cert
      #write_to_cert(name: 'Thomas', date: Date.today.to_s, course_name: 'Test Course', course_desc: 'Test Description' )
    end
    it 'should assign a standard @username to :name' do
      expect(write_to_cert).to be_include('No Name')
    end

    it 'should assign a date to :date' do
      expect(write_to_cert).to be_include(Date.today.to_s)
    end
  end

  context 'with options' do
    before(:each) do
      write_to_cert(name: 'Thomas', date: Date.today.to_s, course_name: 'Test Course', course_desc: 'Test Description')
    end

    it 'should assign "Thomas" to :name' do
      pending
      #puts :name

      #write_to_cert.should_receive(:name).with('hello')
      #expect(write_to_cert).to eq('Thomas')  
    end
  end
end

describe 'Testing Prawn' do
  context 'Rendered PDF-Certificate' do
    before(:each) do
      @date = Date.today
      write_to_cert(name: 'Thomas', date: @date.to_s, course_name: 'Test Course', course_desc: 'Test Description')
      @hash = Digest::SHA256.hexdigest("Thomas - Test Course - #{@date.to_s}")
      @rendered_pdf = File.open "pdf/Thomas-#{@date}.pdf"
      @text_analysis = PDF::Inspector::Text.analyze(@rendered_pdf)
    end


    it 'should have "Thomas" as content' do
      expect(@text_analysis.strings).to include('Thomas')
    end

    it 'should have issue date as content' do
      expect(@text_analysis.strings).to include("#{@date.strftime('Issued on %A, %B %e, %Y')}")
    end

    it 'should include the verification text' do
      expect(@text_analysis.strings).to include('To verify the authenticity of this certificate, please visit: http://agileventures.org/verify/' + @hash)
    end

    after(:each) do
      FileUtils.rm_rf "pdf/*.pdf"
    end

  end
end

describe 'Mail method' do


  Mail.defaults do
    delivery_method :test # in practice you'd do this in spec_helper.rb
  end

    include Mail::Matchers

    before(:each) do
      Mail::TestMailer.deliveries.clear

      Mail.deliver do
        to 'Thomas <thomas@me.com>'
        from 'Sender <info@you.com>'
        subject 'Testing'
        body 'Hello'
      end
    end
  it{ should have_sent_email }
  context 'should send a email' do
    it('with right from address'){ should have_sent_email.from('info@you.com') }
    it('with right to address') { should have_sent_email.to('thomas@me.com') }
    it('with right subject') { should have_sent_email.with_subject('Testing') }
    it('with right body') { should have_sent_email.matching_body('Hello') }
   end

end

