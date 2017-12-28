class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :image,UserUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable ,:lockable, :timeoutable
  devise :omniauthable, omniauth_providers: %i[facebook]

         has_many :comments, dependent: :destroy
         has_many :movies, through: :comments
  validates_presence_of :name
  # validate :password_complexity
   #
   # def password_complexity
   #   if password.present?
   #      if !password.match(/^(?=.*[a-z])(?=.*[A-Z])/)
   #        error add :password, "Password complexity requirement not met"
   #      end
   #   end
   # end

  after_create :send_admin_mail
 def send_admin_mail
   UserMailer.welcome_email(self).deliver_now
 end


  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name

    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end
def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
end
end
