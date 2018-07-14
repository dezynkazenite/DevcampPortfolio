class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  def first_name
    self.name.split.first
  end

  def last_name
    name_array = self.name.split
    return name_array.last unless name_array.length <= 1
    return ""
  end
end
