AV Course Certificates
============
[oo-sw]: http://opensource.org/osd
[support]: http://www.agileventures.org/
[about-us]: http://www.agileventures.org/about-us
[members]: http://www.agileventures.org/users/index

**Generate AgileVentures/ESaaS/edge.edX course certificates** 

## Dependencies
* gem 'colorize'
* gem 'prawn'
* gem 'titleize'
* gem 'mail'

## Installation

Clone the repository to your system and then run the following commands

```
$ bundle
$ rake db:create
$ rake db:migrate
```

## Usage
You can use this tool from `irb` or from the command line. `Mail` needs to be configured with your smtp server and credentials.

#### Command line
(note from heroku use `heroku run bash`)
`ruby -r "./av_certs.rb" -e "write_to_cert(name: 'YOUR NAME', date: '16th March, 2014')"` <= `name:` & `date:` are optional but hey, you do want the certificate to belong to somebody right?

To parse data from a csv file we need to place the file with student names in `data`-folder and call `ruby -r "./generate.rb" -e "generate"`

##### IRB
`load './av_cert.rb'`

`write_to_cert` or `write_to_cert(name: 'Your Name')` or `write_to_cert(name: 'Your Name', date: '2014-01-01') # or any other dateformat you choose`

## Contributing
In the spirit of [open source software][oo-sw], **everyone** is encouraged to help
improve this project.

Here are some ways *you* can contribute:

* by reporting bugs
* by suggesting new features
* by writing code (**no patch is too small**: fix typos, add comments, clean up
  inconsistent whitespace)
* by refactoring code
* by closing issues
* by reviewing code

## ToDo
**A lot!**

* Body text/meassage in outgoing mail.
* Update graphics (remove 'Sample')
* Verification method?
* Refactor the code
* Tests!

## AgileVentures

The principal organization behind this project is AGILEVENTURES NONPROFIT LTD., a nonprofit organization registered in the UK, company number: 08929160

Agile Ventures is a non-profit organization dedicated to crowdsourced learning and project development. We run a [project incubator][support] that stimulates and supports development of social innovations, [open source projects and free software][oo-sw]. But first and foremost, we are a [place for learning][about-us] and personal development with [members][members] from across the world with various levels of competence and experience in software development.

We are proudly using Agile methods and Ruby on Rails as the framework to deliver well tested and solid software.




