class User < ApplicationRecord
  has_many :complains
  extend FriendlyId
  friendly_id :username, use: :slugged
  has_secure_password
  before_create :set_default_role
  before_validation :downcase_user
  mount_uploader :avatar, AvatarUploader
  attr_accessor :current_password

  validates :username, presence: true, length:  {in: 3..12}, format: {with: /(.*)/}
  validates :email, email: true
  validates :email, presence: true, uniqueness: true
  validates_length_of       :password, maximum: 72, minimum: 6, allow_nil: true, allow_blank: false
  validates_presence_of :password_confirmation, if: :password_digest_changed?

  enum role: [:admin, :user]

  private

  def set_default_role
    self.role ||= :user
  end

  validate :current_password_is_correct,
           if: :validate_password?, on: :update

  def current_password_is_correct
    if User.find(id).authenticate(current_password) == false
      errors.add(:current_password, "is incorrect.")
    end
  end
  

  def validate_password?
    !password.blank?
  end
  
  def downcase_user
    self.username = self.username.downcase if self.username?
    self.email = self.email.downcase if self.email?
  end

  def should_generate_new_friendly_id?
    username_changed?
  end
end
