class User < ActiveRecord::Base
	has_attached_file :photo, styles: { thumbnail: "20x20>" },
	   :url	=> "/assets/products/:id/:style/:basename.:extenstion",
	   :path => ":rails_root/public/assets/products/:id/:style/:basename.:extention"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :reviews

has_many :trips

end
