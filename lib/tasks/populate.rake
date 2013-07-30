namespace :db do

  desc "Erase and fill database"
  task :populate => :environment do

    require 'populator'
    require 'faker'
                                                                                                                                                                                                                          
    ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ######  
    ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ######  
    ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ######  
                                                                                                                                                                                                                          
         ##   ##### ###### #### ####  ##     ######  
        ####  ##  ##  ##    ## ##  ## ##     ##      
       ##  ## ##  ##  ##    ## ##     ##     ##      
       ###### #####   ##    ## ##     ##     ####    
       ##  ## ####    ##    ## ##     ##     ##      
       ##  ## ## ##   ##    ## ##  ## ##     ##      
       ##  ## ##  ##  ##   #### ####  ###### ######  
                

    ### First create root category                                                                                                                                                                                                                                                                       
    # Article::Category.populate 3 do |cat|
    #   cat.permalink = Populator.words(1).parameterize
    #   cat.name = (cat.permalink + ' root cat').titleize
    #   cat.description = Populator.paragraphs(1)
    #   cat.position = 0

      ### Create some sub-categories
      # Article::Category.populate 2..3 do |subcat|
      #   subcat.permalink = Populator.words(2).parameterize
      #   subcat.name = (subcat.permalink + ' sub cat').titleize
      #   subcat.description = Populator.paragraphs(1)
      #   subcat.position = 0
      #   subcat.ancestry = cat.id.to_s

      #   ### Create some pages for sub-category
      #   Article::Page.populate 2..4 do |page|
      #     page.permalink = Populator.words(1..2).parameterize
      #     page.title = (page.permalink + ' sub page').titleize
      #     page.body = Populator.paragraphs(3..5)
      #     page.entry = Populator.paragraphs(1)
      #     page.published = true
      #     page.category_id = subcat.id
      #   end

      # end

      ### Create some pages for root category
      # Article::Page.populate 1..3 do |page|
      #   page.permalink = Populator.words(1).parameterize
      #   page.title = (page.permalink + ' root page').titleize
      #   page.body = Populator.paragraphs(3..5)
      #   page.entry = Populator.paragraphs(1)
      #   page.published = true
      #   page.category_id = cat.id
      # end

    # end

    ### Create some static pages
    # Article::Page.populate 2 do |static|
    #   static.permalink = Populator.words(1).parameterize
    #   static.title = static.permalink.titleize
    #   static.body = Populator.paragraphs(3..5)
    #   static.entry = Populator.paragraphs(1)
    #   static.published = true
    # end

    ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ######  
    ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ######  
    ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ###### ######  

      # Specialties

      SpecialtyCategory.populate 2 do |sc|
        sc.name = Faker::Name.name
        Specialty.populate 40 do |s|
          s.specialty_category_id = sc.id
          s.name = Faker::Name.name
        end
      end

      # School Types

      EducationSchoolType.populate 3 do |t|
        t.school_type_name = Faker::Company.name
      end


      # Schools

      @longitude = 50.27
      @latitude = 30.30

      User.populate 70 do |u|
        u.email = Faker::Internet.email
        u.encrypted_password = '#########'
        u.user_type_id = 2

        School.populate 1 do |s|
          Location.populate 1 do |l|
            l.street = Faker::Address.street_name
            l.building = (2.50)
            l.apartment = (5..60)
            l.addressable_id = s.id
            l.addressable_type = "School"
            l.latitude = @longitude += rand(-0.1..0.1)
            l.longitude = @latitude += rand(-0.1..0.1)
            l.gmaps = true
            l.city = Faker::Address.city
            l.formatted_address = Faker::Address.street_address
            l.state = Faker::Address.state
            l.postal_code = Faker::Address.zip
            l.state2 = Faker::Address.state
            l.sublocality = Faker::Address.city
            @location_id = l.id
          end

          @contact_type_id = -1
          Contact.populate 11 do |c|
            c.contact_type_id = (@contact_type_id += 1)
            c.contactable_id = s.id
            c.contactable_type = "School"
            c.value = Populator.words(1)
          end

          DirectorProfile.populate 1 do |d|
            d.name = Faker::Name.name
            d.school_id = s.id
            d.gender = 1..2
          end

          Vacancy.populate 5..10 do |v|
            v.specialty_id = 0..79
            v.school_id = s.id
            v.value = 1..3
          end

          Gallery.populate 1 do |g|
            g.galleryable_id = s.id
            g.galleryable_type = "School"
            Picture.populate 10 do |p|
              p.gallery_id = g.id
              p.title = Faker::Name.name
            end
          end

          s.name = Faker::Company.name
          s.education_school_type_id = (0..2)
          s.location_id = @location_id
          s.user_id = u.id
          s.description = Populator.paragraphs(2..3)
          s.video_url = "http://www.youtube.com/watch?v=NbRck_G_1AI"
          s.permalink = s.name.parameterize
        end

      end

      User.find_each do |u|
        u.password = 'mcmegavolt'
        u.confirm!
      end



  end
end