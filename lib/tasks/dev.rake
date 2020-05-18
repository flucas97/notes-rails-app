namespace :dev do
  desc "Configure development environment"
  task setup: :environment do
    p 'Generating new database'
    %x(rails db:drop db:create db:migrate)

    p 'Creating Users...'
    10.times do |user|
      User.create!(
        email: Faker::Internet.email,
        password: '123456'
      )
    end
    p 'Users were created!'

    p 'Creating my admin user'
    User.create(email:'admin@adm.com', password: '123456')

    p 'Creating Notes...'
    100.times do |note|
      Note.create!(
        title: Faker::BossaNova.artist,
        description: Faker::BossaNova.song,
        user_id: User.all.sample.id
      )
    end
    p 'Notes were created!'
  end
end
