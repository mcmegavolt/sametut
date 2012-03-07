# encoding: utf-8

UserType.create([
  {:user_type_name => "Пошукач (студент, випускник)"},
  {:user_type_name => "Дошкільний навчальний заклад освіти (дит. садочок)"},
  {:user_type_name => "Загальноосвітній навчальний заклад (школа)"},
  {:user_type_name => "Професійно-технічний заклад освіти (ПТУ, коледж)"},
  {:user_type_name => "Вищий начальний заклад освіти"}
])



EducationSchoolType.create([
  {:school_type_name => 'Загальноосвітній навчальний заклад'},
  {:school_type_name => 'Професійно-технічний заклад'},
  {:school_type_name => 'Вищий начальний заклад'}
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