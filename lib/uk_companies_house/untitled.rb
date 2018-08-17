"address"=>{"locality"=>"London", "premises"=>"2nd", "country"=>"United Kingdom", "postal_code"=>"NW3 4QG", "address_line_1"=>"Haverstock Hill"},
"address"=>{"address_line_1"=>"44 Merlin Grove", "locality"=>"Beckenham", "postal_code"=>"BR3 3HU", "region"=>"Kent"},


contact_adress_country = Country.where(name: contact.dig("address", "country")).first
contact_adress = Address.create(address: "#{officer.dig("address","address_line_1")} \n #{officer.dig("address","address_line_2")} \n #{contact.dig("registered_office_address","address_line_3")}",
                              postcode: contact.dig("address","postal_code"),
                              location: contact.dig("address","locality"),
                              country_id: (contact_adress_country.id if contact_adress_country))



geo_data = Geocoder.search('50.131.44.XXX')