require 'faker'

mattress = Category.create!(name: "Mattress")
socks = Category.create!(name: "Sock")

ALPHABET = ('a'..'z').to_a
NUMBERS = (1..9).to_a

30.times do
  mattress.articles << Article.new( title: Faker::Address.street_name,
                                    price_in_dollars: Faker::Number.number(3),
                                    owner_email: Faker::Internet.email,
                                    description: Faker::Lorem.sentence(100),
                                    editor_key: ALPHABET.sample + NUMBERS.sample.to_s + ALPHABET.sample + NUMBERS.sample.to_s + ALPHABET.sample + NUMBERS.sample.to_s
                                    )
end

29.times do
  socks.articles << Article.new( title: Faker::Address.street_name,
                                price_in_dollars: Faker::Number.number(2),
                                owner_email: Faker::Internet.email,
                                description: Faker::Lorem.sentence(100),
                                editor_key: ALPHABET.sample + NUMBERS.sample.to_s + ALPHABET.sample + NUMBERS.sample.to_s + ALPHABET.sample + NUMBERS.sample.to_s
                                )
end
