#!/usr/bin/env ruby
require 'csv'
main_data = CSV.read('av102fall.csv', headers: true) 
main_data.entries.each {|each| each.push('')} 
file = CSV.read('av102fall-full_names.csv', headers: true)   
file.each do |line|
 temp = main_data.entries.assoc(line[0])
 temp[-1] = line[2] if temp
end
csv = CSV.open('av102fall_updated_data.csv','wb') 
sorted = main_data.entries.sort_by { |e| e.nil? ? 0 : e[3] }
csv << main_data.headers
sorted.each {|each| csv << each} 