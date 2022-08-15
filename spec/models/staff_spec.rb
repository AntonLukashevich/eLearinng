# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Staff, type: :model do
  describe 'relationship' do
    it 'belongs_to organization' do
      should belong_to :organization
    end
  end
end
