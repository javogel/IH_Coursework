class Contact < ApplicationRecord

  validates :name, presence: true
  validates :address, presence: true

  has_attached_file :avatar, styles: { large: "200x200" },:path => "public/system/:class/:id/:filename",
    :url => "/system/:class/:id/:basename.:extension"
  validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

end
