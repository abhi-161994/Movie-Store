class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :image,UserUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable ,:lockable, :timeoutable, :omniauthable

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


   def self.from_omniauth(auth, signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user.present?
      user
    else
      # Check wether theres is already a user with the same email address
      user_with_email = User.find_by_email(auth.info.email)
      if user_with_email.present?
        user = user_with_email
      else
          user = User.new
          if auth.provider == "facebook"
            user.provider = auth.provider
            user.uid = auth.uid
            user.email = auth.extra.raw_info.email
            user.password = Devise.friendly_token[0,20]
            user.name = auth.info.name
            user.remote_photo_url = auth.info.image_url
            # Facebook's token doesn't last forever
            user.skip_confirmation!
            user.save

          elsif auth.provider == "google_oauth2"
               user.provider = auth.provider
               user.uid = auth.uid
               # user.first_name = auth.info.first_name
               # user.last_name = auth.info.last_name
               user.email = auth.info.email
               user.password = Devise.friendly_token[0,20]
               user.name = auth.info.name
               user.photo = auth.info.image
               user.skip_confirmation!
               user.save


             elsif auth.provider == "twitter"
                              user.provider = auth.provider
                              user.uid = auth.uid
                              # user.first_name = auth.info.first_name
                              # user.last_name = auth.info.last_name
                              user.email = auth.info.email
                              user.password = Devise.friendly_token[0,20]
                              user.name = auth.info.name
                              user.photo = auth.info.image
                              user.skip_confirmation!
                              user.save

           end
       end
     end
     return user
    end
  end
#   def self.from_omniauth(auth)
#   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#     user.email = auth.info.email
#     user.password = Devise.friendly_token[0,20]
#     user.name = auth.info.name   # assuming the user model has a name
#
#     # If you are using confirmable and the provider(s) you use validate emails,
#     # uncomment the line below to skip the confirmation emails.
#     # user.skip_confirmation!
#   end
# end
# def self.new_with_session(params, session)
#   super.tap do |user|
#     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
#       user.email = data["email"] if user.email.blank?
#     end
#   end
# end
# end
