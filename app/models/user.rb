class User < ApplicationRecord

    has_many :permissions
    has_many :roles, through: :permissions
    has_many :articles
    has_many :comments

    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

    validates_presence_of :username, :mobile, :gender, :dob
  validates_numericality_of :mobile
  validates_length_of :mobile, is: 10

  after_create :assign_user_role

  def assign_user_role
    Permission.create(user_id:self.id, role_id:Role.last.id)
  end

  def role?(role)
    self.roles.pluck(:name).include?(role)
  end
  end