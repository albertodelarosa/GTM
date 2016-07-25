from = DateTime.new(2000,1,1).to_f
to = DateTime.new(2018,12,31).to_f
hostnames = [ "Nike", "Addidas", "Puma", "Reebok", "Vans", "Fila", "Timberland", "Converse" ]
org = Apartment::Tenant.current

Org.create( name: "New Relic", subdomain: "newrelic" ) unless Apartment.tenant_names.include?( 'newrelic' )
Org.create( name: "Old Relic", subdomain: "oldrelic" ) unless Apartment.tenant_names.include?( 'oldrelic' )
Org.create( name: "Cur Relic", subdomain: "currelic" ) unless Apartment.tenant_names.include?( 'currelic' )
Org.create( name: "Nex Relic", subdomain: "nexrelic" ) unless Apartment.tenant_names.include?( 'nexrelic' )
Org.create( name: "Pre Relic", subdomain: "prerelic" ) unless Apartment.tenant_names.include?( 'prerelic' )

500.times do |index|
  date = Time.at( rand * ( to - from ) + from )
  rand = Random.rand( hostnames.size )
  Event.create!( name: org + " " + index.to_s,
                 host: hostnames[ rand ],
                 date: date
                 )
end
puts "Seeding #{ org } tenant is done"
puts

