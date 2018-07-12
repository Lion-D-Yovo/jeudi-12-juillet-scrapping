require 'open-uri'
require 'nokogiri'

###########################################################################################
#écris une méthode qui récupère l'adresse email à partir de l'url d'une mairie, par exemple celle de Vauréal

def get_the_email_of_vaureal
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
    page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |mail|
	  puts mail.text
    end
end

#puts get_the_email_of_vaureal

###########################################################################################
#écris une méthode qui récupère toutes les url de villes du Val d'Oise
#1 => Je recupere les noms des villes

def get_names_towns
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    return list_towns = page.css("p>a").map{ |towns| towns.text}
end

get_names_towns

# => Je recupere les sites webs des villes apartir des noms des villes
#je convertis les majuscules en minuscules et les espaces en "-" pour des urls cleans
def get_websites_towns
    list_towns_websites = []
    get_names_towns.map{ |town|  "http://annuaire-des-mairies.com/95/"+town.downcase.gsub(' ', '-')+".html"}
end

get_websites_towns

# => Je recupere les adresses mails des villes a partir des sites webs des villes
#j'utilise les urls pour recuperer les e-mails
def urls_to_emails(url)
    
    page = Nokogiri::HTML(open(url))
	email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').map{|mail| mail.text}
end

def get_emails_towns
    get_websites_towns.map {|website| urls_to_emails(website)}
end

#puts get_emails_towns


puts list = get_names_towns.zip(get_emails_towns).to_h
