FactoryBot.define do
  factory :post do
    text 'novo texto #hashtag'
    name 'new boys'
    photo { File.new(Rails.root.join('spec', 'fixtures', 'dog.jpg')) }
  end
end
