namespace :dev do
  desc 'TODO'
  task setup: :environment do
    puts 'cadastrando os tipos de contatos....'

    kinds = %w[Amigo Comercial Conhecido]

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts 'tipos de contatos cadastrados com sucesso.'
    puts 'cadastrando os contatos....'

    100.times do |_i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end

    puts 'contatos cadastrados com sucesso.'
    puts 'cadastrando os telefonos....'

    Contact.all.each do |contact|
      Random.rand(5).times do |_i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end

    puts 'telefonos cadastrados com sucesso.'
  end
end
