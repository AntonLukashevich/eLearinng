# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Readed, type: :model do
  describe 'relationship' do
    it 'belongs_to lecture' do
      should belong_to :lecture
    end

    it 'belongs_to user' do
      should belong_to :user
    end
  end
end
