activity_types = []

[
'Coffee',
'Restaurant',
'Drinks',
'Activity'
].each do |name|
  activity = ActivityType.where(:name => name).first_or_create!({
    :name => name
    })
  if activity.new_record?
    if !activity.save
      raise "Could not save activity"
    end
  end
  activity_types << activity
end


activity_types.each do |activity_type|
  3.times do |n|
    description = "#{activity_type.name}#{n}"
    Activity
    .where(:description => description)
    .first_or_create!({
        :description => description,
        :location => "Milano's",
        :img => 'http://demographic.ca/wp-content/uploads/2012/01/Milano11-600x401.jpg',
        :activity_type_id => activity_type.id
      })
  end
end

20.times do |n|
  username = "Ana#{n}"
  user = User.where(:username => username).first_or_create!({
    :username => username, 
    :password => 'password',
    :img => 'http://www.hdartwallpaper.com/wp-content/uploads/2014/05/shakira-wallpaper-widescreen-5.jpg', 
    :age => 20 + rand(20), 
    :gender => ['female','male'][ rand(2) ], 
    :bio => 'I am a wonderful person!'
    }) 
  Preference.create({
    :user_id => user.id,
    :gender_pref => user.male? ? 'female' : 'male',
    :min_age => 20 + rand(10),
    :max_age => 65,
    :activity_type_id => activity_types[rand(4)].id
  })

end
