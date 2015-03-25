class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :recipes

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    has_many :authentications

    def apply_omniauth(omniauth)
  self.email = omniauth['info']['email'] if email.blank?
  self.name = omniauth.info.name if name.blank?
  self.date_of_birth = omniauth.extra.raw_info.birthday
  #self.password = '12345678' if name.password?
  authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
end

def password_required?
  (authentications.empty? || !password.blank?) && super
end

has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
