# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'relationship' do
    it 'has_many managers' do
      should have_many :managers
    end

    it 'has_many staffs' do
      should have_many :staffs
    end

    it 'has_many org_courses' do
      should have_many :org_courses
    end

    it 'belongs_to user' do
      should belong_to :user
    end
  end
end
