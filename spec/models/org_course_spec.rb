# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrgCourse, type: :model do
  describe 'relationship' do
    it 'belongs_to organization' do
      should belong_to :organization
    end
    it 'belongs_to course' do
      should belong_to :course
    end
  end
end
