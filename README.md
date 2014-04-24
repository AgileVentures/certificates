AV certificates
============

Generate course certificates from a csv file

#### Dependencies
gem 'prawn'
gem 'titleize'

#### Usage
You can use this tool from `irb` or from the command line

##### Command line
`ruby -r "./cert_generator.rb" -e "write_to_cert(name: 'YOUR NAME', date: '16th March, 2014')"` <= `name:` & `date:` are optional but hey, you do want the certificate to belong to somebody right?

To parse data from a csv file we need to place the file with student names in `data`-folder and call `ruby -r "./generate.rb" -e "generate"`
##### IRB
`load './cert_generator.rb'`

`write_to_cert` or `write_to_cert(name: 'Your Name')` or `write_to_cert(name: 'Your Name', date: '2014-01-01') # or any other dateformat you choose` 

