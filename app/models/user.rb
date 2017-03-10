class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  validates :name, presence: true
  validates :admin, inclusion: { in: [true, false] }

  def mood
    self.happiness > self.nausea ? "happy" : "sad" if self.happiness && self.nausea
  end
end
