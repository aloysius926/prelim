# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  password_digest        :string(255)
#  remember_token         :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#

class User < ActiveRecord::Base
  before_save {self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 30}
  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@umn.edu\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, on: :create
  #validates :password, length: { minimum: 6 } :on => :create
  has_many :question_ratings
  has_many :answer_ratings
  has_many :answers
  has_many :finished_questions
  has_secure_password
  before_create :create_remember_token
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    self.save!
    UserMailer.password_reset(self).deliver
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  
  private
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
