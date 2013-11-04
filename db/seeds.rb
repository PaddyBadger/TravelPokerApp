%w[jan feb mar apr may jun jul aug sep oct nov dec q1 q2 q3 q4 h1 h2 h3 h4 all].each do |season|
  Season.create(name: 'season', image: "/assets/#{season}.png")
end

puts "#{Season.count} Seasons"

%w[Eating Sleeping Epic_Journeys Sports Entertainment Drinks_and_Night_Life Sightseeing Shopping Festivals_and_Events].each do |category|
  Category.create(name: 'category', image: "/assets/#{category}.png")
end

puts "#{Category.count} Categories"

user = User.create(email: "patriciaestridgedubai@gmail.com", password: 'helloworld')

europe = user.decks.create(title: 'Eating in Europe', location: 'Europe', remote_image_url: 'http://t0.gstatic.com/images?q=tbn:ANd9GcSNVsO5DNbbKJr4VWQIiQCCz40QhvjV4LBccVGo3gzSDdOLPfIOJQ')

world = user.decks.create(title: 'An Incredible Gap Year', location: 'The World', remote_image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1LpqxFgUSjPhU6SENa9kxHH7au1IM4Mz5lcewo4Zyuv9X7nUb')

nandsamerica = user.decks.create(title: 'Exploring the Americas', location: 'North and South America', remote_image_url: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR7uHfJpO2iKCKJwK-cj7spEy3IG-h11Pz6MP7QbJW4rnT0UdOo')

europeandus = user.decks.create(title: 'Dream Trip to Europe and The US', location: 'Europe and US', remote_image_url: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR25OHcqsjLO4swCXmLdSOzP3jQWnmb_LXqYoP7sdi9E6yY62MguQ')

london = user.cards.create(title: 'Saunter Down South Bank', location: 'London, UK', remote_image_url: 'http://photorefraction.files.wordpress.com/2011/03/london-south-bank-1.jpg', url: 'n/a', description: 'If you\'re lucky with the weather, nothing in London beats a wander down South Bank in a crisp sunny day. yes you should totally definitely do this. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.' )

nyc = user.cards.create(title: 'Kayack on the Hudson', location: 'Manhattan, New York', remote_image_url: 'http://paddleforourplanet.org/wp-content/uploads/2010/09/5036264103_57198a78e9.jpg', url: 'n/a', description: 'A novel way to see New York from the river, you can kayak for free on pier 40. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')

paris = user.cards.create(title: 'Put Your Lock on Pont de l\'Archevêché', location: 'Paris, France', remote_image_url: 'https://mw2.google.com/mw-panoramio/photos/small/12455444.jpg', url: 'n/a', description: 'If you\'re lucky with the weather, nothing in London beats a wander down South Bank in a crisp sunny day')

rome = user.cards.create(title: 'Get Spititual in the Sistine Chapel', location: 'Rome, Italy', remote_image_url: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRarVLHpL1cTT5el9tjp3BqbTZaZoWRN2M04meKwicDarw7RiLH', url: 'n/a', description: 'A novel way to see New York from the river, you can kayak for free on pier 40')

rio = user.cards.create(title: 'Live it Up in Lapa', location: 'Rio De Janeiro, Brazil', remote_image_url: 'http://graphics8.nytimes.com/images/2006/11/26/travel/next_600.jpg', url: 'n/a', description: 'If you\'re lucky with the weather, nothing in London beats a wander down South Bank in a crisp sunny day')

toronto = user.cards.create(title: 'Kick Back at the Kensington Market', location: 'Toronto, Canada', remote_image_url: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT1pmpb3Xt3vU1z3HHukSmn_v1zhbXK-fLEnYmPZGO21-5tRuJl', url: 'n/a', description: 'A novel way to see New York from the river, you can kayak for free on pier 40')

buzios = user.cards.create(title: 'Beach Hop in a Buggy', location: 'Buzios, Brazil', remote_image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQphelMnbupTMdI7fPJbfG4DgZqfAg4Hpn2-L0JnsiugdtRvQNT', url: 'n/a', description: 'If you\'re lucky with the weather, nothing in London beats a wander down South Bank in a crisp sunny day')

hanoi = user.cards.create(title: 'September\'s Spectacular in Hanoi', location: 'Hanoi, Vietnam', remote_image_url: 'http://www.vietnamonline.com/userfile/news/dangnguyen/2011/12/Ava_Hanoi%20Firework.jpg', url: 'n/a', description: 'A novel way to see New York from the river, you can kayak for free on pier 40')

europe.cards << london
europe.cards << paris
europe.cards << rome

world.cards << london
world.cards << nyc
world.cards << paris
world.cards << rome
world.cards << rio
world.cards << toronto
world.cards << buzios
world.cards << hanoi

nandsamerica.cards << toronto
nandsamerica.cards << nyc
nandsamerica.cards << rio
nandsamerica.cards << buzios

europeandus.cards << london
europeandus.cards << paris
europeandus.cards << rome
europeandus.cards << toronto
europeandus.cards << nyc

puts "#{user.cards.count} Cards"
puts "#{user.decks.count} Decks"

