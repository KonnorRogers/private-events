# frozen_string_literal: true

# models an event like a birthday party etc
class Event < ApplicationRecord
  # allows the calling of event.creator to find the user
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  # must include the through table
  has_many :attendances
  # this allows you to call Event.find(id).users
  has_many :attendees, through: :attendances, source: :user
end
