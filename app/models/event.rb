# frozen_string_literal: true

# models an event like a birthday party etc
class Event < ApplicationRecord
  # allows the calling of event.creator to find the user
  belongs_to :creator, class_name: 'User',
                       foreign_key: 'creator_id'
end
