# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Manager, type: :model do
  describe 'relationship' do
    it 'belongs_to organization' do
      should belong_to :organization
    end
    it 'belongs_to user' do
      should belong_to :user
    end

  end
end
