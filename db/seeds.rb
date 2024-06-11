require 'faker'

ProductCategory.destroy_all
User.destroy_all
Artist.destroy_all
Product.destroy_all
Order.destroy_all
OrderProduct.destroy_all

# Define categories
categories = [
  { name: '3D', slug: '3d', identifier: 0 },
  { name: 'Design', slug: 'design', identifier: 1 },
  { name: 'Drawing & Painting', slug: 'drawing-and-painting', identifier: 2 },
  { name: 'Software Development', slug: 'software-development', identifier: 3 },
  { name: 'Self Improvement', slug: 'self-improvement', identifier: 4 },
  { name: 'Fitness & Health', slug: 'fitness-and-health', identifier: 5 },
  { name: 'Music & Sound Design', slug: 'music-and-sound-design', identifier: 6 },
  { name: 'Photography', slug: 'photography', identifier: 7 },
  { name: 'Writing & Publishing', slug: 'writing-and-publishing', identifier: 8 },
  { name: 'Business & Money', slug: 'business-and-money', identifier: 9 },
  { name: 'Education', slug: 'education', identifier: 10 },
  { name: 'Comics & Graphic Novels', slug: 'comics-and-graphic-novels', identifier: 11 },
  { name: 'Fiction Books', slug: 'fiction-books', identifier: 12 },
  { name: 'Audio', slug: 'audio', identifier: 13 },
  { name: 'Recorded Music', slug: 'recorded-music', identifier: 14 },
  { name: 'Films', slug: 'films', identifier: 15 },
  { name: 'Gaming', slug: 'gaming', identifier: 16 },
  { name: 'Other', slug: 'other', identifier: 17 }
]

categories.each do |category|
  ProductCategory.create!(category)
end

def generate_jwt(email)
  JWT.encode(email, Rails.application.secrets.secret_key_base, 'HS256')
end

# Create Users
User.create!(
  name: 'niklas',
  username: 'schoen-dev',
  email: 'niklas@schoenberger.dev',
  token: generate_jwt('niklas@schoenberger.dev')
)

User.create!(
  name: 'Gumroad Team',
  username: 'gumroad',
  email: 'gumroad@schoenberger.dev',
  token: generate_jwt('gumroad@schoenberger.dev')
)

# Create Artists
10.times do
  name = Faker::Artist.name
  Artist.create!(
    name:,
    username: name.parameterize
  )
end

categories = ProductCategory.all
artists = Artist.all

product_images = {
  '3d' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg',
    'image-00007.jpg',
    'image-00008.jpg',
    'image-00009.jpg',
    'image-00010.jpg',
    'image-00011.jpg'
  ],
  'design' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg'
  ],
  'drawing-and-painting' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg',
    'image-00007.jpg',
    'image-00008.jpg',
    'image-00009.jpg'
  ],
  'software-development' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg'
  ],
  'self-improvement' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg',
    'image-00007.jpg',
    'image-00008.jpg',
    'image-00009.jpg',
    'image-00010.jpg'
  ],
  'fitness-and-health' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg',
    'image-00007.jpg'
  ],
  'music-and-sound-design' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg',
    'image-00007.jpg'
  ],
  'photography' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg',
    'image-00007.jpg',
    'image-00008.jpg',
    'image-00009.jpg'
  ],
  'writing-and-publishing' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg',
    'image-00007.jpg'
  ],
  'business-and-money' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg'
  ],
  'education' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg'
  ],
  'comics-and-graphic-novels' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg'
  ],
  'fiction-books' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg'
  ],
  'audio' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg'
  ],
  'recorded-music' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg'
  ],
  'films' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg'
  ],
  'gaming' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg'
  ],
  'other' => [
    'image-00001.jpg',
    'image-00002.jpg',
    'image-00003.jpg',
    'image-00004.jpg',
    'image-00005.jpg',
    'image-00006.jpg',
    'image-00007.jpg'
  ]
}

# Create Products
6.times do
  product_category = categories.sample
  image = "/#{product_category.slug}/#{product_images[product_category.slug].sample}"
  Product.create!(
    name: Faker::Lorem.words(number: rand(1..4)).join(' ').titleize,
    description: Faker::Lorem.paragraph(sentence_count: 1),
    price: Faker::Commerce.price(range: 10..100),
    artist: artists.sample,
    product_category:,
    image:
  )
end

# Create Orders with Products
users = User.all
products = Product.all

4.times do
  order = Order.create!(
    user: users.sample,
    amount: Faker::Commerce.price(range: 5000..20_000),
    tip: Faker::Commerce.price(range: 500..5000)
  )

  2.times do
    OrderProduct.create!(
      order:,
      product: products.sample
    )
  end
end
