Carpool.create!([
  {event: "Monthly Training", address: "my place", notes: "yo", depart: "2000-01-01 09:00:00", return: "2000-01-01 17:00:00", seats_offered: 4, created_by: 1, event_date: "2016-03-12"},
  {event: "Monthly Training", address: "asd", notes: "asd", depart: "2000-01-01 09:00:00", return: "2000-01-01 17:00:00", seats_offered: 1, created_by: 1, event_date: "2016-01-01"},
  {event: "Monthly Training", address: "asdf", notes: "asdf", depart: "2000-01-01 09:00:00", return: "2000-01-01 17:00:00", seats_offered: 4, created_by: 1, event_date: "2016-01-01"}
])
Post.create!([
  {title: "hey hey", author: "you", body: "hey hey hey hey", active: true, created_by: nil}
])
Rental.create!([
  {event_date: nil, description: "", event: "", notes: "", claimed_by: 1, created_by: 1},
  {event_date: nil, description: "", event: "", notes: "", claimed_by: 1, created_by: 1},
  {event_date: nil, description: "", event: "", notes: "", claimed_by: 1, created_by: 1},
  {event_date: nil, description: "", event: "", notes: "", claimed_by: 1, created_by: 1}
])
Search.create!([
  {title: "adsf", author: "asdf", body: "asdf", search_date: "", active: nil, creatd_by: nil}
])
Seat.create!([
  {carpool_id: 3, created_by: 1},
  {carpool_id: 3, created_by: 1},
  {carpool_id: 3, created_by: 1},
  {carpool_id: 2, created_by: 1},
  {carpool_id: 1, created_by: 1},
  {carpool_id: 1, created_by: 1},
  {carpool_id: 4, created_by: 1},
  {carpool_id: 4, created_by: 1},
  {carpool_id: 5, created_by: 1},
  {carpool_id: 6, created_by: 1}
])
Sponsor.create!([
  {name: "Skedko", sponsor_url: "http://www.skedco.com/", image: "logos/skedko.jpg", created_by: nil},
  {name: "Xtreme Consulting", sponsor_url: "http://www.kipetech.com/index.aspx", image: "logos/xtreme.png", created_by: nil},
  {name: "SAP", sponsor_url: "http://www.sap.com/", image: "logos/sap.png", created_by: nil},
  {name: "Trail Club of Oregon", sponsor_url: "http://www.trailsclub.org/", image: "logos/trailclub.png", created_by: nil},
  {name: "Cascade Prime Timers", sponsor_url: "http://www.cascadeprimetimers.org/", image: "logos/primetimers.gif", created_by: nil},
  {name: "Portland General Electric", sponsor_url: "http://www.portlandgeneral.com/", image: "logos/pge.png", created_by: nil},
  {name: "Leatherman", sponsor_url: "http://www.leatherman.com/", image: "logos/leatherman.jpg", created_by: nil},
  {name: "Benchmade", sponsor_url: "http://www.benchmade.com/", image: "logos/benchmade.jpg", created_by: nil},
  {name: "Bedrug", sponsor_url: "http://www.bedrug.com/", image: "logos/bedrug.png", created_by: nil},
  {name: "WARN", sponsor_url: "https://www.warn.com/", image: "logos/warn.png", created_by: nil},
  {name: "Gladstone Nissan", sponsor_url: "http://www.gladstonenissan.com/", image: "logos/nissan.png", created_by: nil},
  {name: "Rose City Futsal", sponsor_url: "http://rosecityfutsal.com/", image: "logos/rosecityfutsal.png", created_by: nil},
  {name: "In Memoriam of Georgeanne Y. Barr", sponsor_url: "http://obits.oregonlive.com/obituaries/oregon/obituary.aspx?n=georganne-y-barr&pid=155252609&fhid=11493", image: "logos/.", created_by: nil},
  {name: "Byron Smith, State Farm Insurance", sponsor_url: "http://www.byronsmithinsurance.com/", image: "logos/", created_by: nil},
  {name: "Eastside Free Methodist Church ", sponsor_url: "", image: "logos/", created_by: nil},
  {name: "Lynn Bauer", sponsor_url: "", image: "logos/", created_by: nil},
  {name: "Martha Anderson", sponsor_url: "", image: "logos/", created_by: nil},
  {name: "B. Antonius", sponsor_url: "", image: "logos/", created_by: nil},
  {name: "Ms. D. Worthen", sponsor_url: "", image: "logos/", created_by: nil},
  {name: "Mr. J. Bane", sponsor_url: "", image: "logos/", created_by: nil}
])
User.create!([
  {name: "Scott Hillson", email: "scott.hillson@gmail.com", token: nil, admin: true, password_digest: "$2a$10$ExdLFoJWvKyxdS3j0qMXE.CFgZoVhw8gVcB.8RZ2uFtLGTyPyS2Hy", activated: false}
])
