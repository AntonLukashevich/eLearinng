require 'rails_helper'

RSpec.describe Lecture, type: :model do
  describe 'relationships' do
    it 'belongs_to course' do
      should belong_to :course
    end

    it 'has_many readeds' do
      should have_many :readeds
    end

    it 'has_rich_text content' do
      should have_rich_text :content
    end
  end
end