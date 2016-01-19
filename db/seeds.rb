# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create[
	{
		name: "Quality Assurance"
	},
	{
		name: "Sales"
	},
	{
		name: "Full Stack Eng"
	},
	{
		name: "Solution Engineer"
	},
	{
		name: "Customer Success"
	},
	{
		name: "Marketing"
	},
	{
		name: "Operations & Finance"
	},
	{
		name: "People & Strategy"
	},
	{
		name: "HR"
	}
]

