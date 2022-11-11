require 'faker'

Article.destroy_all

puts 'Creating 200 fake articles...'

200.times do
  Article.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph,
    published: Faker::Boolean.boolean
  )
end
