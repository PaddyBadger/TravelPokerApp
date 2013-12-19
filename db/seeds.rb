%w[jan feb mar apr may jun jul aug sep oct nov dec q1 q2 q3 q4 h1 h2 h3 h4 all].each do |season|
  Season.create(name: "#{season}", image: "/assets/#{season}.png")
end

puts "#{Season.count} Seasons"

%w[Eating Sleeping Epic_Journeys Sports Entertainment Drinks_and_Night_Life Sightseeing shopping Festivals_and_Events].each do |category|
  Category.create(title: "#{category}", image: "/assets/#{category}.png")
end

puts "#{Category.count} Categories"

user = User.create(email: "patriciaestridgedubai@gmail.com", name: 'Paddy', password: 'helloworld')

europe = user.decks.create(
  title: 'Eating in Europe', 
  location: 'Europe', 
  remote_image_url: 'http://t0.gstatic.com/images?q=tbn:ANd9GcSNVsO5DNbbKJr4VWQIiQCCz40QhvjV4LBccVGo3gzSDdOLPfIOJQ'
  )

world = user.decks.create(
  title: 'An Incredible Gap Year', 
  location: 'The World', 
  remote_image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1LpqxFgUSjPhU6SENa9kxHH7au1IM4Mz5lcewo4Zyuv9X7nUb'
  )

nandsamerica = user.decks.create(
  title: 'Exploring the Americas', 
  location: 'North and South America', 
  remote_image_url: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR7uHfJpO2iKCKJwK-cj7spEy3IG-h11Pz6MP7QbJW4rnT0UdOo')

europeandus = user.decks.create(
  title: 'Dream Trip to Europe and The US', 
  location: 'Europe and US', 
  remote_image_url: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR25OHcqsjLO4swCXmLdSOzP3jQWnmb_LXqYoP7sdi9E6yY62MguQ'
  )

londonweekend = user.decks.create(
  title: 'A Perfect Weekend in London', 
  location: 'London', 
  remote_image_url: 'https://lh5.googleusercontent.com/-WLxh9I1KVZg/UoDoF624fgI/AAAAAAAABO0/vWPk7fg8vMU/w1399-h543-no/homepage1.png'
  )

budapestdays = user.decks.create(
  title: 'Beautiful Budapest in Two Days', 
  location: 'Budapest, Europe', 
  remote_image_url: 'https://lh4.googleusercontent.com/-dGOafhgvMOE/UoDoFHDJZeI/AAAAAAAABOk/Nxh14NPwaHo/w1393-h544-no/homepage3.png'
  )

fireandbrimstone = user.decks.create(
  title: 'Fire and Brimstone in the UK\'s South East', 
  location: 'East Sussex and Kent, UK', 
  remote_image_url: 'https://lh6.googleusercontent.com/-UBtQa93fKMY/UoDoD-q1dDI/AAAAAAAABOY/MYDveIbPzts/w1391-h545-no/homepage2.png'
  )

alpstopten = user.decks.create(
  title: 'The Alps Top 10', 
  location: 'The Alps, Europe', 
  remote_image_url: 'https://lh5.googleusercontent.com/-5W4r57UBa8k/UoDoFsQjj-I/AAAAAAAABOw/JGneW5geh4c/w1393-h545-no/homepage4.png'
  )

newyorkinfive = user.decks.create(
  title: 'Five Packed Days in New York', 
  location: 'Manhattan, New York', 
  remote_image_url: 'https://lh5.googleusercontent.com/-kwOw0t3BAWw/UkRdUQCi2aI/AAAAAAAABLM/JZcGywySvps/w1105-h829-no/20130926_165144.jpg'
  )

puts "#{user.decks.count} Decks"

southbank = user.cards.create(
  title: 'Saunter Down South Bank', 
  location: 'Southbank, London, UK', 
  remote_image_url: 'http://photorefraction.files.wordpress.com/2011/03/london-south-bank-1.jpg', 
  url: 'http://southbanklondon.com/', 
  description: 'If you\'re lucky with the weather, nothing gives you a sense of London\'s unique mixture of history, development, and modernism like a walk down South Bank. Take at least 3 hours, start at The London Eye (very close to London Waterloo Station) and head East, towards London Bridge. 
  
Along the way, you\'ll see The London Eye, Westminster, The Tate Modern, St. Paul\'s Catheral, Shakespeare\'s Globe, London Bridge, Tower Bridge and the Tower of London, all of which are worth a visit in their own right if you have time.
  
Pop into the Oxo Tower for a drink or lunch on the top floor restaurant, and soak up the view. Stop at the Tate Modern\'s outside bar, or take a slight detour to London Bridge\'s Borough Market and be spoilt for food choices.',   
  season_id: "all",
  category_id: "Sightseeing"
  )

puts "#{user.cards.count} Cards"

kayaknyc = user.cards.create(
  title: 'Kayack on the Hudson', 
  location: 'Pier 40, Manhattan, New York', 
  remote_image_url: 'http://paddleforourplanet.org/wp-content/uploads/2010/09/5036264103_57198a78e9.jpg', 
  url: 'http://www.downtownboathouse.org/free-kayaking/', 
  description: 'For a slightly different perspective on New York, take a trip to one of The Downtown Boathouse\'s locations along the Hudson to try out some free Kayacking.
  
You\'ll have a short safety briefing, and be left pretty much to your own devises, while you paddle about within the area. It\'s a great way to cool down when it\'s hot, and an unusual way to see Manhattan.
  
Also availabe at Pier 96.',
  season_id: 'h4',
  category_id: 'Sports'
  )

puts "#{user.cards.count} Cards"

larchveche = user.cards.create(
  title: 'Put Your Lock on Pont de l\'Archevêché', 
  location: 'Paris, France', 
  remote_image_url: 'https://mw2.google.com/mw-panoramio/photos/small/12455444.jpg', 
  url: 'n/a', 
  description: 'For an extra romantic twist on a trip to Paris, incorporate The Pont de l\'Archevêché, which crosses from Notre-Dame Cathedral to the Left Bank of the Seine into your wanderings.

The bridge is decorated with thousands of ribbons and padlocks, left as declarations of love by couples wandering the city.

Add your own, or let your mind be blown by the many different shapes, sizes and declaratons of love',
  season_id: 'all',
  category_id: 'Sightseeing'
  )

puts "#{user.cards.count} Cards"

sistine = user.cards.create(
  title: 'Get Spititual in the Sistine Chapel', 
  location: 'Vatican City, Rome, Italy', 
  remote_image_url: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRarVLHpL1cTT5el9tjp3BqbTZaZoWRN2M04meKwicDarw7RiLH', 
  url: 'http://en.wikipedia.org/wiki/Sistine_Chapel', 
  description: 'Much of Rome is utterly mind blowing, both historically and spiritually. No trip would be complete without a visit to Vatican City, St. Peter\'s Basillica, and of course, the Sistine Chapel.

The Chapel is part of the Apostolic Palace, the Pope\'s official residence, and has hosted visitors since Michelangelo completed the ornate painting that covers the walls and ceilings in 1541.

The painting took a total of 10 years in two separate stints, between 1508 and 1541, and is an unbelievably moving sight nearly 500 years later',
  season_id: 'all',
  category_id: 'Sightseeing'
  )

puts "#{user.cards.count} Cards"

lapaparty = user.cards.create(
  title: 'Live it Up in Lapa', 
  location: 'Rio De Janeiro, Brazil', 
  remote_image_url: 'http://graphics8.nytimes.com/images/2006/11/26/travel/next_600.jpg', 
  url: 'http://en.wikipedia.org/wiki/Lapa,_Rio_de_Janeiro', 
  description: 'Few places in Rio offer the raw combination of Latin culture, history and edginess like Lapa. 

Historically, Lapa has been known for both its cultural sights and night life. Street bars and Samba are plentiful in this part of town, where you can get a (very strong) Caiphrinia for $R7, and drink on the street.

Bars and Clubs are plentiful, as are friendly locals and musicians. Start under the Arocos da Lapa around 11pm, and walk around the busy area, which keeps partying till dawn. 

Be aware of staying in the busy areas, and of pickpockets - it\'s safer to carry only the ,oney that you need for the evening on your person.',
  season_id: 'h3',
  category_id: 'Drinks_and_Night_Life'
  )

puts "#{user.cards.count} Cards"

buziosbuggies = user.cards.create(
  title: 'Beach Hop in a Buggy', 
  location: 'Buzios, Brazil', 
  remote_image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQphelMnbupTMdI7fPJbfG4DgZqfAg4Hpn2-L0JnsiugdtRvQNT', 
  url: 'http://en.wikipedia.org/wiki/Arma%C3%A7%C3%A3o_dos_B%C3%BAzios', 
  description: 'Popular with Brazillian tourists, Buzios boasts a calm and polished town center, great for eating, shopping, and like much of brazil, staying out late.

The best part of this town are the beaches, which are plentiful and stunning. From gigantic Geriba, great for surf and water sports, to Brava, which boasts fine pink coloured sand.

The easiest way to navigate between these beaches is with a buggy, of which there are many in Buzios, and which are great fun to bumble around in.

Ask at your accommodation for their recommended provider, and make sure you do a test drive before agreeing in a buggy - sometimes mechanical standards can be a little lower than you might expect.',
  season_id: 'h3',
  category_id: 'Sightseeing'
  )

puts "#{user.cards.count} Cards"

hanoifireworks = user.cards.create(
  title: 'September\'s Spectacular in Hanoi', 
  location: 'Hanoi, Vietnam', 
  remote_image_url: 'http://www.vietnamonline.com/userfile/news/dangnguyen/2011/12/Ava_Hanoi%20Firework.jpg', 
  url: 'http://en.wikipedia.org/wiki/National_Day_(Vietnam)', 
  description: 'Vietnam\'s National Day, on the 2nd September, is a day of national celebration. One of the best spots to witness it is Hanoi, where the cities many Lakes are lit up with spectacular fireworks. 

The best places to watch from are the rooftops around Hanoi\'s Hoan Kiem Lake in Hanoi\'s Latin Quarter. Most of the hotel\'s in the area are built to be tall and thin (to avoid tax), so ask around about rooftop access when choosing your hotel.

Make sure you take a walk around the lake during the day - the fireworks are organised by Vietnam\'s Military, and the fireworks are so big that you could well be forgiven for mistaking the firewoks for something more sinister at first glance!',
  season_id: 'sep',
  category_id: 'Festivals_and_Events'
  )

puts "#{user.cards.count} Cards"


