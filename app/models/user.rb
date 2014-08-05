class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_ROLES = %w(normal staff admin).freeze

  validates :role, presence: true, inclusion: {in: VALID_ROLES}

  def real_name
    first_name + " " + last_name
  end

  def normal?
    role == 'normal'
  end

  def staff?
    role == 'staff'
  end

  def admin?
    role == 'admin'
  end
end
