class User < ApplicationRecord
  has_and_belongs_to_many :events
  has_and_belongs_to_many :locations

  has_paper_trail

  ### VALIDATIONS ###
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }

  ### CLASS METHODS ###
  def self.alive
    where(deleted_at: nil)
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
