class Contact < ActiveRecord::Base
  has_one :phone_num
  validates :firstname, presence: true
  validates :lastname, presence: true
end

