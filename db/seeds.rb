# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
category = Category.create(title: "Desk")
category2 = Category.create(title: "Meeting Space")
category.properties.create(title: "Property1",
                            description: "This is a desk property",
                            price: 100,
                            city: "Denver",
                            state: "Colorado")
category.properties.create(title: "Another Property",
                           description: "This is the second desk property",
                           price: 15,
                           city: "Los Angeles",
                           state: "California" )
category2.properties.create(title: "Meeting Property",
                            description: "This is a meeting property",
                            price: 20,
                            city: "Miami",
                            state: "Florida" )
category2.properties.create(title: "Second Property",
                             description: "This is the second meeting property",
                             price: 30,
                             city: "Seattle",
                             state: "Washington" )
                             
