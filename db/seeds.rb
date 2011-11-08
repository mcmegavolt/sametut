# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


EducationSchoolType.create([
  {:school_type_name => 'Zagalna'},
  {:school_type_name => 'Serednya spetsialna'},
  {:school_type_name => 'Nepovna vyscha'},
  {:school_type_name => 'Povna vyscha'},
  {:school_type_name => 'Magistratura'}
])




EducationDegreeLevel.create([
  {:education_degree_level => 'Molodshyj Spetsialist'},
  {:education_degree_level => 'Bakalavr'},
  {:education_degree_level => 'Spetsialist'},
  {:education_degree_level => 'Magistr'},
  {:education_degree_level => 'Doktor'}
])
