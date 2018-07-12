require 'open-uri'
require 'nokogiri'

###########################################################################################
#


def name
    page = Nokogiri::HTML(open("www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    page.css('ul.col3 > li > a').map{|depute| depute.text}
end
puts name
   
   
def depute
    page = Nokogiri::HTML(open("www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    page.css('ul.col3 > li > a').map{|depute| depute['href']}
   
end
puts depute
   
   