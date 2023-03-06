FactoryBot.define do
  factory :post do
    title { 'title' }
    text { 'text' }
    author_id { association(:user).id }
  end
end