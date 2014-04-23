#!/usr/bin/env ruby

# Call with: ruby -r "./cert_generator.rb" -e "write_to_cert(name: 'Your Name', date: '24rd of March, 2014')"
# With irb:
# $ irb
# > load './cert_generator.rb'
# > method (or any method you want to call)

$:.unshift File.dirname(__FILE__)
gem 'prawn'
gem 'titleize'


require 'rubygems'
require 'prawn'
require 'titleize'
require 'date'


@username = 'thomas ochman'
@bg_image = File.join(File.dirname(__FILE__), "pdf/AV102-certificate300.jpg")
#@output = "pdf/full_template.pdf"



def write_to_cert(options = {})
  defaults = {:name => @username, :date => Date.today.to_s}
  options = defaults.merge(options)
  name = options.fetch(:name)
  date = Date.parse(options.fetch(:date))

 
  output = "pdf/#{name}-#{date}.pdf"
    File.delete(output) if File.exist?(output)
    Prawn::Document.generate("pdf/#{name}-#{date}.pdf", :page_size => "A4",:background => @bg_image, :background_scale => 0.2431, :page_layout => :landscape, :left_margin => 30, :right_margin => 40, :top_margin => 7, :bottom_margin => 0, :skip_encoding => true, ) do |pdf|
      pdf.move_down 230
      pdf.font "Helvetica"
      pdf.text name.titleize, :size => 48, :style => :bold, :color => "F07F48", :indent_paragraphs => 10
      pdf.move_up 165
      pdf.text date.strftime("Issued on %A, %B %e, %Y"), :size => 14, :style => :normal, :color => "575756", align: :right

    end
end




