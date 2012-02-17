# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


EducationSchoolType.create([
  {:school_type_name => 'Загальна'},
  {:school_type_name => 'Середня спеціальна'},
  {:school_type_name => 'Неповна вища'},
  {:school_type_name => 'Вища'},
  {:school_type_name => 'Магістр'}
])




EducationDegreeLevel.create([
  {:education_degree_level => 'Молодший спеціаліст'},
  {:education_degree_level => 'Бакалавр'},
  {:education_degree_level => 'Спеціаліст'},
  {:education_degree_level => 'Магістр'},
  {:education_degree_level => 'Доктор'}
])


 Address::Region.create([
    { :name => 'Київська область' },
    { :name => 'АР Крим' },
    { :name => 'Вінницька область' },
    { :name => 'Волинська область' },
    { :name => 'Дніпропетровська область' },
    { :name => 'Донецька область' },
    { :name => 'Житомирська область' },
    { :name => 'Закарпатська область' },
    { :name => 'Запоріжська область' },
    { :name => 'Івано-Франківська область' },
    { :name => 'Кіровоградська область' },
    { :name => 'Луганська область' },
    { :name => 'Львівська область' },
    { :name => 'Миколаївська область' },
    { :name => 'Одеська область' },
    { :name => 'Полтавська область' },
    { :name => 'Рівенська область' },
    { :name => 'Сумська область' },
    { :name => 'Тернопільська область' },
    { :name => 'Харківська область' },
    { :name => 'Херсонська область' },
    { :name => 'Хмельницька область' },
    { :name => 'Черкаська область' },
    { :name => 'Чернігівська область' },
    { :name => 'Чернівецька область' }
  ])

  Address::City.create([
    {:name => 'Київ', :region=> Address::Region.find_by_name('Київська область') },
    {:name => 'Вінниця', :region=> Address::Region.find_by_name('Вінницька область')},
    {:name => 'Дніпропетровськ', :region=> Address::Region.find_by_name('Дніпропетровська область') },
    {:name => 'Донецьк', :region=> Address::Region.find_by_name('Донецька область') },
    {:name => 'Житомир', :region=> Address::Region.find_by_name('Житомирська область') },
    {:name => 'Запоріжжя', :region=> Address::Region.find_by_name('Закарпатська область') },
    {:name => 'Ивано-Франківськ', :region=> Address::Region.find_by_name('Івано-Франківська область') },
    {:name => 'Кіровоград', :region=> Address::Region.find_by_name('Кіровоградська область') },
    {:name => 'Луганськ', :region=> Address::Region.find_by_name('Луганська область')},
    {:name => 'Львів', :region=> Address::Region.find_by_name('Львівська область')},
    {:name => 'Миколаїв', :region=> Address::Region.find_by_name('Миколаївська область')},
    {:name => 'Одеса', :region=> Address::Region.find_by_name('Одеська область')},
    {:name => 'Луцьк', :region=> Address::Region.find_by_name('Волинська область')},
    {:name => 'Ужгород', :region=> Address::Region.find_by_name('Закарпатська область')},
    {:name => 'Полтава', :region=> Address::Region.find_by_name('Полтавська область')},
    {:name => 'Рівне', :region=> Address::Region.find_by_name('Рівенська область')},
    {:name => 'Суми', :region=> Address::Region.find_by_name('Сумська область')},
    {:name => 'Тернопіль', :region=> Address::Region.find_by_name('Тернопільська область')},
    {:name => 'Харків', :region=> Address::Region.find_by_name('Харківська область')},
    {:name => 'Херсон', :region=> Address::Region.find_by_name('Херсонська область')},
    {:name => 'Хмельницький', :region=> Address::Region.find_by_name('Хмельницька область')},
    {:name => 'Черкаси', :region=> Address::Region.find_by_name('Черкаська область')},
    {:name => 'Чернігів', :region=> Address::Region.find_by_name('Чернігівська область')},
    {:name => 'Чернівці', :region=> Address::Region.find_by_name('Чернівецька область')},
    {:name => 'Сімферополь', :region=> Address::Region.find_by_name('АР Крим')},
    {:name => 'Севастополь', :region=> Address::Region.find_by_name('АР Крим')},
    {:name => 'Ялта', :region=> Address::Region.find_by_name('АР Крим')}
  ])