# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe Answer, type: :model do
  describe 'relationship' do
    it 'belongs_to question' do
      should belong_to :question
    end
  end
end
