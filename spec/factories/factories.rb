FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :user, :class => 'User' do
    email
    password '12345678'
    password_confirmation '12345678'
  end
end

FactoryGirl.define do
  factory :book do |f|
    f.title "Trip to Italy"
    f.author "James Bond"    
  end
end

FactoryGirl.define do
  factory :lending, :class => 'Lending' do
    date_out '01.01.2003'
    book
    user 
   end
end
