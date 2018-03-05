require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    described_class.new(text: 'Macaco loco', 
                        name: 'Rodrigo', 
                        photo: File.new(Rails.root.join('spec', 
                                                        'fixtures', 
                                                        'dog.jpg')))
  end

  it 'is valid with valid params' do
    expect(subject).to be_valid
  end

  it 'is invalid without photo' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end
end
