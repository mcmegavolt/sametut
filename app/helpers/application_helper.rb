module ApplicationHelper

  #def link_to_remove_fields(name, var)
  #  var.hidden_field(:_destroy) + link_to_function(name, 'remove_fields(this)')
  #end
  #
  #
  #def link_to_add_fields(name, f, association)
  #  new_object = f.object.class.reflect_on_association(association).klass.new
  #  fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
  #    render(association.to_s.singularize + "_fields", :f => builder)
  #  end
  #  link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}')")
  #end

def link_to_remove_fields(name, f)
  f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
end

def link_to_remove_fieldset(name, f)
  f.hidden_field(:_destroy) + link_to_function(name, "remove_fieldset(this)")
end

#def link_to_add_fields(name, f, association)
#  new_object = f.object.class.reflect_on_association(association).klass.new
#  fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
#    #render("/" + association.to_s + "/" + association.to_s.singularize + "_fields", :f => builder)
#    render(association.to_s.singularize + "_fields", :f => builder)
#  end
#  link_to_function(name, ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
#end

def link_to_add_fields(name, f, association)
  new_object = f.object.class.reflect_on_association(association).klass.new
  fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
    render("/" + association.to_s + "/" + association.to_s.singularize + "_fields", :f => builder)
  end
  link_to_function(name, ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
end


  def contact_value contact
    if contact.contact_type.to_sym == :url
      cleaned = contact.value.gsub(/http:\/\//,'')
      url = "http://#{cleaned}"
      link_to cleaned, url, :rel => 'nofollow', :target => '_blank'
    elsif contact.contact_type.to_sym == :email
      link_to contact.value, "mailto:#{contact.value}"
    else
      contact.value
    end
  end

  def social_icon contact

    cleaned_social_url = contact.value.gsub(/http:\/\//,'')
    social_url = "http://#{cleaned_social_url}"

    link_to social_url, :target => '_blank', :title => t(:"site.contacts.#{contact.contact_type}"), :rel => 'nofollow' do
      image_tag 'social-icons/32x32/' + contact.contact_type + '.png', :style => 'width: 32px; height: 32px;'
    end

  end

  def address_value location
    if location
      address = []
      city = if location.custom_city.present?
               location.custom_city.strip
             elsif location.city.present?
               location.city
             end
      if city
        address << city
      end

      if location.street.present?
        address << location.street.strip
      end

      if location.building.present?
        address << "#{location.building.strip}"
      end

      if location.apartment.present?
        address << t(:'providers.edit.location.ap_short') + " #{location.apartment.strip}"
      end

      address.join(', ')
    end
  end


end

