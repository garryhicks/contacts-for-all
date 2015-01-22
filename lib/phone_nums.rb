class ExtraContacts < ActiveRecord::Base
  belongs_to :contact
  validates :contact_id, presence: true
  validates :contact_id, numericality: {only_integer: true}
  validates :phone, presence: true
end