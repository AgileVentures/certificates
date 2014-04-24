#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'active_support/all'
require 'titleize'
require 'csv'
require 'mail'
require 'colorize'
require 'av_certs.rb'

def generate
  csv_text = File.read('data/test_data.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    students = row.to_hash
    email = students['Email']
    write_to_cert(name: (students['Name']))
    puts 'Generated certificate for:'.bold + students['Name'].bold.green
    if email.nil?
      puts 'No email for '.bold.red + students['Name'].bold.green + ' present!'.bold.red
    else
      send_mail((students['Name']), email, @output)
      puts 'Generated email to:'.bold + students['Name'].bold.green
    end
  end
end




