# frozen_string_literal: true

class Lecture < ApplicationRecord
  belongs_to :course
  has_many :readeds, dependent: :delete_all
  acts_as_list
  has_rich_text :content

  validates :title, presence: true

  scope :by_position, -> { order(position: :asc) }
end
