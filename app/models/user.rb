require 'digest/sha2'

class User < ActiveRecord::Base
  has_many :occupants
  has_many :drivers
  #has_many :events, :through => :occupants
  attr_accessible :email, :first_name, :password, :name, :role,
    :password_confirmation, :surname, :change_password
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

