namespace :dev do
  desc "Configure development environment"
  task setup: :environment do
    p 'Creating Notes...'
    100.times do |note|
      Note.create!(
        title: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 90.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    p 'Contatos criados!'
  end

  end
end
