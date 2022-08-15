# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Testing, type: :model do
  describe 'relationship' do
    it 'belongs_to course' do
      should belong_to :course
    end

    it 'has_many questions' do
      should have_many :questions
    end
  end
end
