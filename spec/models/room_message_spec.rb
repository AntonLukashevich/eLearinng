# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoomMessage, type: :model do
  describe 'relationship' do
    it 'belongs_to user' do
      should belong_to :user
    end

    it 'belongs_to room' do
      should belong_to :room
    end
  end
end
