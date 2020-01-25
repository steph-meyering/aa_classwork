# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all

c01 = Cat.create(birth_date: '2015/01/20', name: 'Kitty', color: 'Black', sex: 'F', description: 'nice cat!')
c02 = Cat.create(birth_date: '2014/01/20', name: 'Jone', color: 'Orange', sex: 'M', description: 'feral cat!')
c03 = Cat.create(birth_date: '2015/04/10', name: 'Stephane', color: 'Blue', sex: 'M', description: 'a wild cat!!')
c04 = Cat.create(birth_date: '2018/09/20', name: 'Baby', color: 'White', sex: 'F', description: 'baby cat!')
c05 = Cat.create(birth_date: '2010/01/20', name: 'Nanny', color: 'Black', sex: 'F', description: 'old cat!')