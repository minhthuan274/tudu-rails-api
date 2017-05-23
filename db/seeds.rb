5.times do |n|
  title = Faker::Name.name 
  Task.create!(
    title: title
  )
end