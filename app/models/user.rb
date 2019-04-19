class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id'

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { maximum: 50 }
end
