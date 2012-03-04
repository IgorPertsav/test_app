class User < ActiveRecord::Base

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}, :length =>{:maximum => 20}
  validates :email, :presence => true, :uniqueness => {:case_sensitive => false}, :format => {:with => email_regex}
end
