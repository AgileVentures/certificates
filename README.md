AV certificates
============

Generate course certificates from a csv file

#### Dependencies
gem 'prawn'
gem 'titleize'

#### Usage
You can use this tool from `irb` or from the command line

##### Commandline
`ruby -r "./cert_generator.rb" -e "write_to_cert(name: 'Sam Joseph', date: '16th March, 2014')"` <= `name:` & `date:` are optional but hey, you do want the certificate to belong to somebody right?
##### IRB
`load './cert_generator.rb'`

`write_to_cert` or `write_to_cert(name: 'Your Name')` or `write_to_cert(name: 'Your Name', date: '2014-01-01') # or any other dateformat you choose` 

