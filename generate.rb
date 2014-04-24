#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'titleize'
require 'csv'
require 'mail'
require 'colorize'
require 'av_certs.rb'

def generate
  csv_text = File.read('data/data.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    students = row.to_hash
    write_to_cert(name: (students['Name']))
    puts "Generated certificate for:".bold + students['Name'].bold.green    
  end
end




