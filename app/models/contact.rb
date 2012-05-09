class Contact < ActiveRecord::Base

  belongs_to :contactable, :polymorphic => true

  scope :by_type, order(:contact_type_id)

  CONTACT_TYPES = %w(phone email url skype icq facebook twitter vkontakte odnoklasniki livejournal blogger google youtube vimeo)

  def contact_type
    CONTACT_TYPES[contact_type_id]
  end

end
