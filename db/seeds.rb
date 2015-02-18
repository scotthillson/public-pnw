Member.create!([
  {name: "Tony Hobkirk", title: "President", image: "small-tony.jpg", image_big: "medium-tony.jpg"},
  {name: "Josh Evey", title: "Vice President", image: "small-josh.jpg", image_big: "medium-josh.jph"},
  {name: "Jennifer Kauppi", title: "Secretary", image: "small-jennifer.jpg", image_big: "medium-jennifer.jpg"},
  {name: "Scott Houser", title: "Board Member", image: "small-scott.jpg", image_big: "medium-scott.jpg"}
])
Search.create!([
  {title: "Gales Creek Missing Male", author: "Scott Houser", body: "On 4/22 the Washington County Sherriff's Office requested assistance from PNWSAR in the search for a 51 year old missing Hillsboro man near the Gales Creek Campground in western Washington County.  The man had been previously reported by relatives as missing and possibly despondent.  His vehicle was located abandoned near the campground.\r\n\r\nFor three days combined search teams from several counties launched a large search effort in the area around the campground and many nearby trails, mountains and drainages.  On the first day PNWSAR was responsible for searching a 300 meter radius around the location of the man's vehicle.  On the second and third day PNWSAR was assigned to search several very steep and difficult areas between Gales Creek and Story Burn Road, and were assisted by members of Yamhill County SAR and the Washington County Explorers.  Several storm fronts brought heavy rain and made search conditions challenging.  PNWSAR completed all requested assignments but found no clues or signs of the missing man.\r\n\r\nOn 4/24 WCSO deputies made the difficult decision to suspend the search.  PNWSAR extends our gratitude to our fellow SAR volunteers and our sympathy to the missing man's friends and family.", search_date: "4/22-4/23"}
])
User.create!([
	{name: 'Scott Hillson', email: 'scott.hillson@gmail.com', password: 'tinybrownies', admin: true, activated: false}
])