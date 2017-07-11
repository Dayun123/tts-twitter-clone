namespace :db do
  desc "Seeds tweets for a few users"
  task seed_tweets: :environment do
    User.destroy_all
    10.times do
      password = password_confirmation = 'myPassword'
      user = User.new(
        name: Faker::Name.name,
        username: Faker::Zelda.unique.character,
        bio: Faker::Lorem.paragraph,
        location: Faker::Address.city + ', ' + Faker::Address.state,
        email: Faker::Internet.unique.email,
        password: password,
        password_confirmation: password
        )
      user.save!
      (rand(4) + 3).times do
        Tweet.create(user_id: user.id, message: Faker::Hipster.sentence(rand(3) + 1))
      end
    end

  end

end
