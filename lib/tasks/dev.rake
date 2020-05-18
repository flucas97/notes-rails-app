namespace :dev do
  desc "Configure development environment"
  task setup: :environment do
    p 'Gerando novo banco'
    %x(rails db:drop db:create db:migrate)

    p 'Creating Uses...'
    10.times do |user|
      User.create!(
        email: Faker::Internet.email,
        password: '123456'
      )
    end
    p 'Users were created!'
  end

  task setup: :environment do
    p 'Creating Notes...'
    100.times do |note|
      Note.create!(
        title: 'Lucas',
        description: 'Nota',
        user_id: User.all.sample.id
      )
    end
    p 'Notes were created!'
  end
end
