require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  subject { described_class.new(name: 'newhashtag') }

  it 'is valid with valid params' do
    expect(subject).to be_valid
  end

  context '#name' do
    it 'must be present' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'must be unique' do
      create(:hashtag, name: 'newhashtag')
      expect(subject).not_to be_valid
    end
  end
end
