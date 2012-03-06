class User < ActiveRecord::Base

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessor :password, :password_confirm

  has_many :microposts, :dependent => :destroy

  validates :password, :confirmation => true, :presence => true, :length => {:within => 6..20}
  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}, :length =>{:maximum => 20}
  validates :email, :presence => true, :uniqueness => {:case_sensitive => false}, :format => {:with => email_regex}

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def feed
    # This is preliminary. See Глава 12 for the full implementation.
    Micropost.where("user_id = ?", id)
  end

  private
  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end


end
