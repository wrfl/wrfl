class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def real_name
    first_name + " " + last_name
  end

  def staff?
    role.present?
  end

  def admin?
    role == 'admin'
  end
end
