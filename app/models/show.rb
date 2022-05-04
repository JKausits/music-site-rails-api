class Show < ApplicationRecord
  belongs_to :venue
  scope :filter_start_at,  ->(start_at) {where("start_at >= ?", start_at)}
  scope :filter_end_at,  ->(end_at) {where("start_at <= ?", end_at)}
end
