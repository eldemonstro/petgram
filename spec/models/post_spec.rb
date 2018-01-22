require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.new(text: 'Macaco loco', name: 'Rodrigo') }

  it 'is valid with valid params' do
    expect(subject).to be_valid
  end

  it 'is invalid without text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end
