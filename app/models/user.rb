require 'digest/sha2'

# User class - one record per person. Authorisation is fairly standard stuff,
# from "Agile Wed Development with Rails" 4th edition
#

class User < ActiveRecord::Base
  has_many :occupants
  has_many :drivers
  has_many :events, :through => :occupants
  # set up parent/child relationship
  has_many :children, :class_name => "User", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "User"

  attr_accessible :email, :first_name, :password, :name, :role,
    :password_confirmation, :surname, :change_password, :facebook_id,
    :parent_id
  attr_accessor :password_confirmation
  attr_reader :password

  ROLE_TYPES = [ "Student", "Parent","Admin" ]
  validates :name, :email, :presence => true, :uniqueness => true
  validates :first_name, :surname, :presence => true
  validates :password, :confirmation => true
  validates :role, :inclusion => ROLE_TYPES
  validate :password_must_be_present
  validates :email, :format => {
    :with => /^[0-9A-Za-z\._\-]+@[0-9A-Za-z_\.\-]+/,
    :message => "address invalid"
    }

  before_save do |user|
    user.gravatar_hash = Digest::MD5.hexdigest(user.email.to_s.downcase)
  end

  def User.authenticate(name, password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "herewegoagain" + salt)
  end

  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  # refer railscast #274
  def send_password_reset
    self.password_reset_token = SecureRandom.urlsafe_base64
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  private

    def password_must_be_present
      errors.add(:password, "Missing Password") unless hashed_password.present?
    end

    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end

end

