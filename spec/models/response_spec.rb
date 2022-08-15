# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Response, type: :model do
  describe 'relationship' do
    it 'belongs_to question' do
      should belong_to :question
    end

    it 'belongs_to user' do
      should belong_to :user
    end
  end
end
