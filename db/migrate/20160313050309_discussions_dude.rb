class DiscussionsDude < ActiveRecord::Migration
  def change
    create_table :discussions, force: true do |t|
      t.text    "body"
      t.string   "subject"
      t.integer  "created_by"
      t.datetime "updated_at"
      t.datetime "created_at"
    end
    create_table :comments, force: true do |t|
      t.text     "body"
      t.integer  "discussion_id"
      t.integer  "created_by"
      t.datetime "updated_at"
      t.datetime "created_at"
    end
    create_table :subscriptions, force: true do |t|
      t.integer  "user_id"
      t.integer  "discussion_id"
      t.datetime "updated_at"
      t.datetime "created_at"
    end
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
  end
end
