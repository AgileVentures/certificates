#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'prawn'
require 'titleize'
require 'active_support/inflector'
require 'date'


@username = 'No Name'
@bg_image = File.join(File.dirname(__FILE__), 'templates/AV102-certificate300.jpg')


def write_to_cert(options = {})
  defaults = {:name => @username, :date => Date.today.to_s}
  options = defaults.merge(options)
  name = options.fetch(:name)
  date = Date.parse(options.fetch(:date)) 
  output = "pdf/#{name}-#{date}.pdf"
  
  File.delete(output) if File.exist?(output)
  Prawn::Document.generate("pdf/#{name}-#{date}.pdf",
                           :page_size => 'A4',
                           :background => @bg_image,
                           :background_scale => 0.2431,
                           :page_layout => :landscape,
                           :left_margin => 30,
                           :right_margin => 40,
                           :top_margin => 7,
                           :bottom_margin => 0,
                           :skip_encoding => true ) do |pdf|
    pdf.move_down 230
    pdf.font 'Helvetica'
    pdf.text name.titleize, :size => 48, :style => :bold, :color => 'F07F48', :indent_paragraphs => 10
    pdf.move_up 165
    pdf.text date.strftime('Issued on %A, %B %e, %Y'), :size => 14, :style => :normal, :color => '575756', align: :right
  end
  @output = output
end

def send_mail(name, email, file)
  mail = Mail.new do
    from     'AgileVentures <info@agileventures.org>'
    to       "#{name} <#{email}>"
    subject  'AV-102 Certificate'
    body     File.read('data/body.txt')
    add_file :filename => file, :mime_type => 'application/x-pdf', :content => File.read(file)
  end
  mail.delivery_method :smtp, address: 'send.one.com', port: 1025
  #mail.deliver
end




