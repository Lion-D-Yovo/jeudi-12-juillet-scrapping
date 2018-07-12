require 'open-uri'
require 'nokogiri'

###########################################################################################
#écris une méthode qui récupère l'adresse email à partir de l'url d'une mairie, par exemple celle de Vauréal

def get_the_email_of_a_townhal_from_its_webpage
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
    doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |mail|
	  puts mail.text
    end
end
get_the_email_of_a_townhal_from_its_webpage

###########################################################################################
#écris une méthode qui récupère toutes les url de villes du Val d'Oise
#1 => Je recupere les noms des villes

def get_names_of_val_doise_townhalls
    doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    return list_towns = doc.css("p>a").map{ |towns|
	  towns.text
    }
end
get_names_of_val_doise_townhalls

# => Je recupere les sites webs des villes apartir des noms des villes
#je convertis les majuscules en minuscules et les espaces en "-" pour des urls cleans
def get_websites_val_doise_townhalls
    list_towns_websites = []
    get_names_of_val_doise_townhalls.map{ |town|  "http://annuaire-des-mairies.com/95/"+town.downcase.gsub(' ', '-')+".html"
    }
   
end
p get_websites_val_doise_townhalls

# => Je recupere les adresses mails des villes a partir des sites webs des villes
#je 
def get_all_the_urls_of_val_doise_townhalls(website)
    
    doc = Nokogiri::HTML(open(website))

	doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |mail|
        puts mail.text
    end
end

get_all_the_urls_of_val_doise_townhalls

#{ "name" => "nomDeLaVille", "email" => "ville@machin.chose" }


puts [get_names_of_val_doise_townhalls, get_websites_val_doise_townhalls]