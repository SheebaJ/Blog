class User < ApplicationRecord
  attr_accessor :login

    has_many :permissions
    has_many :roles, through: :permissions
    has_many :articles
    has_many :comments

    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

    validates_presence_of :username, :mobile, :gender, :dob
  validates_numericality_of :mobile
  validates_length_of :mobile, is: 10
  validate :validate_age
  def validate_age
    if dob.present? && dob > 18.years.ago.to_date
        errors.add(:dob, 'should be over 18 years old.')
    end
end


  after_create :assign_user_role

  def assign_user_role
    Permission.create(user_id:self.id, role_id:Role.last.id)
  end

  def role?(role)
    self.roles.pluck(:name).include?(role)
  end

  def self.find_for_database_authentication warder_condition
    conditions = warder_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {
      value: login.strip.downcase
    }]).first
  end
  end