class Event < ApplicationRecord
  belongs_to :location
  has_many :users

  # GET /event/new
  def new
    @event = Event.new
  end
end
