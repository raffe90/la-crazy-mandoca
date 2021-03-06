class Image < ActiveRecord::Base
  has_one :post, :as => :mediable
  belongs_to :user

  has_attached_file :media, styles: { original: {animate: true}, thumb: ["300x300>", animate: false]}
  # has_attached_file :media
  validates_attachment_content_type :media, content_type: /\Aimage\/.*\Z/


  # def media_url(style = 'thumb')
  #   self.media.url(style.to_sym)
  # end
end
