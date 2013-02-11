class Zombie < ActiveRecord::Base
  attr_accessible :age, :bio, :name

  has_one :brain, dependent: :destroy

  has_many :assignments
  has_many :roles, through: :assignments

  before_save :make_rotting
  after_save :decomp_change_notification, if: :decomp_changed?

  scope :rotting, where(rotting: true)
  scope :fresh, where("age < 20")
  scope :recent, order("created_at desc").limit(3)

  def make_rotting
  	self.rotting = true if age.to_i > 20
  end

  def as_json(options = nil)
    super(options ||
      {include: :brain, except: [:created_at, :updated_at, :id]})
  end

  private

  def decomp_change_notification
    ZombieMailer.decomp_change(self).deliver
  end

end
