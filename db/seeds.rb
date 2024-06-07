# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
Product.destroy_all

Product.create!([
                  {
                    title: 'Product XYZ',
                    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
                    category: 'Design'
                  },
                  {
                    title: 'English',
                    description: 'C.'
                  }
                ])

p "Created #{Product.count} Products"
