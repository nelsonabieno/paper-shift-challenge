class User < ApplicationRecord
  has_paper_trail
  has_many :events
  has_many :locations

  ### VALIDATIONS ###
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }

  ### CLASS METHODS ###
  def self.alive
    where(deleted_at: nil)
  end

  # GET /user/new
  def new
    @user = User.new
  end

  def self.deleted
    where.not(deleted_at: nil)
  end

  def self.find(id)
    where(deleted_at: nil, id: id).first
  end

  ### INSTANCE METHODS ###
  def destroy
    self.paper_trail_event = 'destroy'

    self.update(deleted_at: Time.now)
  end
end
