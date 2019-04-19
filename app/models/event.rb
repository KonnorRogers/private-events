# frozen_string_literal: true

# models an event like a birthday party etc
class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User',
                    foreign_key: 'creator_id'
end
