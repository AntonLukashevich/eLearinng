# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Certificate, type: :model do
  describe 'relationships' do
    it 'belongs_to course' do
      should belong_to :course
    end

    it 'belongs_to user' do
      should belong_to :user
    end
  end
end
