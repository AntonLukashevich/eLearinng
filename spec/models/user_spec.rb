# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationship' do
    it 'belongs_to role' do
      should belong_to :role
    end

    it 'has_and_belongs_to_many course' do
      should have_and_belong_to_many :courses
    end

    it 'has_many certificates' do
      should have_many :certificates
    end

    it 'has_many achievements' do
      should have_many :achievements
    end

    it 'has_many readeds' do
      should have_many :readeds
    end

    it 'has_many responses' do
      should have_many :responses
    end

    it 'has_many individuals' do
      should have_many :individuals
    end

    it 'has_many organizations' do
      should have_many :organizations
    end

    it 'has_many managers' do
      should have_many :managers
    end

    it 'has_many room_users' do
      should have_many :room_users
    end

    it 'has_many room_messages' do
      should have_many :room_messages
    end

  end
end
