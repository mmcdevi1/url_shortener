Fabricator(:link) do 
  url { Faker::Internet.url }
  slug { Faker::Lorem.word }
  clicks { 0 }
end