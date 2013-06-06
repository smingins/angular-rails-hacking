class Photo < ActiveRecord::Base
  belongs_to :album
  attr_accessible :title


  attr_accessible :image
  has_attached_file :image, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/assets/:style/missing.png"


  def thumbnail_url
    image.url(:thumb)
  end

end
