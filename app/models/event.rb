# frozen_string_literal: true

# models an event like a birthday party etc
class Event < ApplicationRecord
  belongs_to :user, class_name: 'Creator',
                    foreign_key: 'creator_id'
end